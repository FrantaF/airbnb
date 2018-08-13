include ListingsHelper

class ListingsController < ApplicationController
   before_action :require_login 
   
   def search_box   
   end

   def search
      render "show_search_results"
   end

   def create
   end

   def create_new_listing         
      listing = Listing.new(listing_params)
      listing.user_id = current_user.id
      if listing.save
         # set user status to host. Add condition to application.erb to display extra link on navbar 
         #for user_host. Create a view page your_listings/:id. Display all listings with 
         #user id retrieved from params. Redicrect to this page. Make the page of those without
         #host status unaccessable    
         render "SOME PAGE"
      end
   end

   def search_results      
      #INFO LOST WHEN REDIRECT      
      @listings = Listing.where("country LIKE ? AND city LIKE ?", "%#{params[:user][:country]}%","%#{params[:user][:city]}%")      
      @listings = style_listings(@listings)
      render "show_search_results"
   end

   private

   def listing_params      
      params.require(:user).permit(:description, :country, :city, :street, :price_per_night, :property_scope, :property_scope)
   end   

end


