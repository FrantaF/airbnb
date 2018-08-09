Rails.application.routes.draw do
  root 'listings#index'

 # get 'listings/index'
 # get 'listings/show'

 # resources :listings

 resources :users, only: [:create] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
 end

#  resources :questions do
#    resources :answers
# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end