Rails.application.routes.draw do
  root 'sessions#login'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"    

  get "/users_edit" => "users#show"
  post "/users_edit" => "users#edit"

  get "/listings_search_box" => "listings#search_box"
  get "/listings_search" => "listing#search"
  post "/listings_search" => "listings#search_results" 

  post "/become_host" => "listings#create"
  get "/become_host" => "listings#create"
  get "/listings_create" => "listings#create"
  post "listings_create" => "listings#create_new_listing"

  get "/user_listings" => "listings#user_listings"
  post "/user_listings" => "listings#user_listings"


  get "/listing/:id" => "listings#show"

  scope as: "user_profile" do
    post "/user_profile/:id" => "users#profile"
    get "/user_profile/:id" => "users#profile"
  end

  delete "/log_out" => "sessions#destroy", as: :custom_sign_out
  
  resources :users, only: [:create, :edit, :update] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end