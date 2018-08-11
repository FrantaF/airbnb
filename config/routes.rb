Rails.application.routes.draw do
  root 'sessions#sign_in'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"  
  get "/login" => "users#login"
  get "/listings" => "listings#index"
  get "/users_edit" => "users#edit"

  resources :users, only: [:create, :edit] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end