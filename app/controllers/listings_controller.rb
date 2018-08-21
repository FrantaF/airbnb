include ListingsHelper

class ListingsController < ApplicationController
   before_action :require_login 
   
   def search_box         
      @display_carousel = true
   end

   def delete
      listing = Listing.find(params[:id])
      listing.destroy
      redirect_to user_profile_path(current_user.id)      
   end

   def update      
      listing = Listing.find(params[:id])
      listing.update(image: params[:listing][:image])
      redirect_to user_profile_path(current_user.id)
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
      
      # listing.amenities     
      
      if listing.save
         #listing.amenities.create(params[:amenity])    
         params[:amenity].each do |amenity|
            amenity = Amenity.new(listing_id: listing.id, amenity: amenity)      
            amenity.save
         end         
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

   #search through city        
   @listings = Listing.where("city LIKE ?", "%#{params[:user][:locaiton]}%")                              
   
   #if nothing is found, search through country
   if @listings[0] == nil
      @listings = Listing.where("country LIKE ?", "%#{params[:user][:locaiton]}%")                        
   end

   #if nothing is sitll found, return the whole table  
   if @listings[0] == nil
      @listings = Listing.all
   end      

   @listings = @listings.paginate(page: params[:page], per_page: 9)
   render "show_search_results"
end

private

def listing_params      
   params.require(:user).permit(:title, :description, :country, :city, :street, :price_per_night, :property_type, :property_scope, :number_of_guests, :image, :amenity)
end   

end


