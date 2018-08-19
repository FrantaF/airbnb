Rails.application.routes.draw do

  # scope as "amenities_create" do
  #   post "/amenities/create/amenity" => "amenities#create"
  # end


  post '/update/user/description' => 'users#update_description'
  

  scope as: "braintree_new" do
    get '/braintree/new/:id' => 'braintree#new'
    post '/braintree/new/:id' => 'braintree#new'
  end
  
  scope as: "braintree_checkout" do
    post '/braintree/checkout/:id' => "braintree#checkout"
    get '/braintree/checkout/:id' => "braintree#checkout"
  end

  root 'sessions#login'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"    

  get "/users_edit" => "users#show"
  post "/users_edit" => "users#edit"

  get "/listings_search_box" => "listings#search_box"
  post "/listings_search_box" => "listings#search_box"
  get "/listings_search" => "listing#search"
  post "/listings_search" => "listings#search_results" 

  post "/host_property" => "listings#create"
  get "/host_property" => "listings#create"
  get "/listings_create" => "listings#create"
  post "listings_create" => "listings#create_new_listing"  

  scope as: "listing" do
    get "/listing/:id" => "listings#show"    
  end

  post "/listing/:id" => "listings#update"

  scope as: "user_profile" do
    post "/user_profile/:id" => "users#profile"
    get "/user_profile/:id" => "users#profile"
  end

  scope as: "create_booking" do
    post "/create_booking/:id" => "bookings#create"
    get "/create_booking/:id" => "bookings#create"
  end



  delete "/log_out" => "sessions#destroy", as: :custom_sign_out

  resources :users, only: [:create, :edit, :update] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end