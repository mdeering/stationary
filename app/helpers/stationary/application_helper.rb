module Stationary
  module ApplicationHelper
    def method_missing(method_name, *args)
      # May want to drop the match on url and path in favor of having access to other
      # methods and helpers from within the main application
      if method_name.match(/_(url|path)$/) && main_app.respond_to?(method_name)
        main_app.send(method_name, *args) 
      else
        super
      end
    rescue
      super
    end
  end
end
