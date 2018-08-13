Rails.application.routes.draw do
  root 'sessions#login'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"    

  get "/users_edit" => "users#show"
  post "/users_edit" => "users#edit"

  get "/listings_search_box" => "listings#search_box"
  get "/listings_search" => "listing#search"
  post "/listings_search" => "listings#search_results" 

  # post "/sign_out" => "sessions#destroy"
  
  resources :users, only: [:create, :edit] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end