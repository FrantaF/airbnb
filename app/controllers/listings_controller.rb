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
      @display_carousel = true
   end

   def create_new_listing         
      listing = Listing.new(listing_params)
      listing.user_id = current_user.id
      if listing.save          
         current_user.update(:role => 1)
         redirect_to user_profile_path(current_user.id)
      end
   end   

   def listing     
   end

   def show
      @listing = Listing.find(params[:id])
      render "listing"
   end

   def search_results                             
      @listings = Listing.where("country LIKE ? AND city LIKE ?", "%#{params[:user][:country]}%","%#{params[:user][:city]}%")                              
      render "show_search_results"
   end

   private

   def listing_params      
      params.require(:user).permit(:description, :country, :city, :street, :price_per_night, :property_type, :property_scope)
   end   

end


