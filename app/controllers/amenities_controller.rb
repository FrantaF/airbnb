class AmenitiesController < ApplicationController
   before_action :require_login

   def create
      amenity = Amenity.new(amenity_params)      
      amenity.user_id = params[listing_id]
      amenity.save
   end

   private

   def amenity_params      
      params.require(:amenity).permit(:option0, :option1, :option2, :option3, :option4)
   end   


end
