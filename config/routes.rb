Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #how should I think about what this is doing?
  resource :session
  resources :users
end
