include ListingsHelper

class ListingsController < ApplicationController
   before_action :require_login 
   
   def search_box   
   end

   def search
      render "show_search_results"
   end

   def search_results      
      #INFO LOST WHEN REDIRECT      
      @listings = Listing.where("country LIKE ? AND city LIKE ?", "%#{params[:user][:country]}%","%#{params[:user][:city]}%")      
      @listings = style_listings(@listings)
      render "show_search_results"
   end

end


