module Stationary
  module Generators
    class InstallGenerator < Rails::Generators::Base
   
      def create_initializer_file
        create_file "config/initializers/stationary_config.rb", "# Add stationary initialization content here"
      end

      def add_routes
        log :route, 'Stationary Route Insert'
        sentinel = /^end$/
        inject_into_file 'config/routes.rb', "\n  root :to => Stationary::Engine\n  match '/:path(.:format)', :to => Stationary::Engine, :constraints => { :path => /.+?/ }\n\n", { :before => sentinel, :verbose => true }
      end
   
    end
  end
end
