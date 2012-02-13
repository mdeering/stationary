module Stationary

  class InvalidPath < StandardError; end
  class UnknownTemplate < StandardError; end

  class ApplicationController < ::ApplicationController

    layout :set_layout 

    Stationary.configuration.skip_before_filter.each do |filter|
      skip_before_filter filter
    end

    rescue_from InvalidPath, UnknownTemplate, :with => :not_found

    def show
      # make sure filenames are any combination of letters, separated by zero or more hypens
      unless (segments = url_path.grep(/\A[a-z](?:-?[a-z]+)*\z/)) == url_path
        raise InvalidPath, "Path contains invalid characters #{url_path}"
      end

      path = Pathname.new(Stationary.configuration.root)
      segments.each { |s| path += s }

      if template = template_path(path)
        render :file => template.to_s
      else
        raise UnknownTemplate, "No template for #{path}"
      end
    end

    private

      def set_layout
        params[:stationary_layout] || Stationary.configuration.layout
      end

      # First we will look if the path is a directory with an index template inside of ti
      # if not then we will look for a template by the name of the last segment of the url
      # using all of the template types that we have registred below.
      def template_path(path)
        # Add a new template extension here if we need to.
        [ 'haml', 'erb' ].each do |template_extension|
          if path.directory? && (path + "index.html.#{template_extension}").file?
            return "#{path}/index"
          elsif (path.dirname + (path.basename.to_s + ".html.#{template_extension}")).file?
            return path.dirname + path.basename.to_s
          end
        end
        nil
      end

      # Split up the incoming path into its segments.  This implementation changes
      # with different versions of rails.  The path param already comes in as an array
      # with older versions of rails using the same route.
      def url_path
        @path ||= params[:path].present? ? params[:path].split('/') : []
      end

      def not_found
        raise ActionController::RoutingError.new "No route matches [#{request.request_method}] \"/#{params[:path]}\""
      end

  end

end
