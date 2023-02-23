Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "password", to:"passwords#edit"
  patch "password", to:"passwords#update", as: :edit_password

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get ":id", to: "sessions#show", as: :show



  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  root "main#index"
end
