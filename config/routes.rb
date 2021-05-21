Rails.application.routes.draw do
  post "/auth/login", to: "auth#login"
  post "/auth/signup", to: "auth#create"
end
