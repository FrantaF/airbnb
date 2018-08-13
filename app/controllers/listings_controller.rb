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
      # byebug   
      listing = Listing.new(listing_params)
      if listing.save
         render "root_url"
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


