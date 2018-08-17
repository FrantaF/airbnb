require 'date'
class BookingsController < ApplicationController
   before_action :require_login 

   def create      

      @booking = Booking.new(booking_params)
      num_of_nights =  Date.parse(params[:booking][:end_date]) - Date.parse(params[:booking][:start_date])
      price_per_night = Listing.find(params[:id]).price_per_night
      booking_price = num_of_nights * price_per_night
      @booking.total_price = booking_price
      
      if @booking.save
         # PostmanWorker.perform_later(current_user.id, params[:listing_id], @booking.id)

         #pass on the booking id for retrieval of payment info
         session["booking_id"] = @booking.id
         redirect_to braintree_new_path(current_user.id)         
      else
         # @listing = Listing.find(@booking.listing_id)
         # @errors = @booking.errors.full_messages
         # render 'listings/show'
         # redirect_to user_listing_path(@booking.user_id, @booking.listing_id)
      end
   end

   def destroy
      @booking = booking.find(params[:id])
      @booking.destroy
      redirect_to user_bookings_path
   end

   def index
      if !current_user
         redirect_to '/'
      else
         @user = current_user
         @bookings = @user.bookings.order(updated_at: :desc)
      end
   end

   private

   def booking_params
      params.require(:booking).permit(:user_id, :listing_id, :start_date, :end_date)
   end

end
