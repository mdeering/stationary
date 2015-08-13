module Stationary
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def create_initializer_file
        create_file "config/initializers/stationary.rb" do <<-TXT
# The example below shows how to configure Stationary to allow public
# access to the pages behind devise and also set the root directory for
# Stationary to look for template files.
#Stationary.configure do |config|
#  config.root               = "\#{Rails.root}/app/views/site"
#  config.skip_before_filter = :authenticate_user!
#end
TXT
        end
      end

      def add_routes
        log :route, 'Stationary Route Insert'
        sentinel = /^end$/
        inject_into_file 'config/routes.rb', "\n  root :to => Stationary::Engine\n  get '/:path(.:format)', :to => Stationary::Engine, :constraints => { :path => /.+?/ }\n\n", { :before => sentinel, :verbose => true }
      end

    end
  end
end
