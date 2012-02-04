Rails.application.routes.draw do
  mount Stationary::Engine => "/"
  match '/login', :to => 'controller#action', :as => 'login'
end
