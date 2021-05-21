Rails.application.routes.draw do
  post "/auth/login", to: "auth#login"
  post "/auth/signup", to: "auth#create"
  resources :users
  resources :tasks
  resources :projects
end
