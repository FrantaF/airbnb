include ListingsHelper

class ListingsController < ApplicationController
   before_action :require_login 
   
   def search_box         
      @display_carousel = true
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
         #Create a view page your_listings/:id. 
         #Display all listings with user id retrieved from params. Redicrect to this page. 
         #Make the page of those without host status unaccessable    
         current_user.update(:role => 1)
         redirect_to user_listings_path
      end
   end   

   def listing
      Listing.find(params[:id])
   end

   def show
      render "listing"
   end

   def search_results                 
      # You need to incorporate tags into the search here!!!!
      # @listings = Listing.where("country LIKE ? AND city LIKE ?", "%#{params[:user][:country]}%","%#{params[:user][:city]}%")      
      @listings = Listing.where("country LIKE ? AND city LIKE ?", "%#{params[:user][:country]}%","%#{params[:user][:city]}%")      
      @listings = style_listings(@listings)
      render "show_search_results"
   end

   private

   def listing_params      
      params.require(:user).permit(:description, :country, :city, :street, :price_per_night, :property_scope, :property_scope, :image)
   end   

end


