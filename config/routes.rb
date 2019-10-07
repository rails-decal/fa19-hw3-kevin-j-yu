Rails.application.routes.draw do
  root "main#index"
  get "/cities/view", to: "cities#view"
  get "/cities/new", to: "cities#new"
  post "/cities/create", to: "cities#create"
  get "/cities/update", to: "cities#update_get"
  post "/cities/update", to: "cities#update_post"
end
