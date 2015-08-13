Stationary::Engine.routes.draw do
  get '/:path(.:format)', :to => 'application#show', :constraints => { :path => /.+?/ }
  root :to => 'application#show'
end
