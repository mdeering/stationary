Stationary::Engine.routes.draw do
  match '/:path(.:format)', :to => 'application#show', :constraints => { :path => /.+?/ }
  root :to => 'application#show'
end
