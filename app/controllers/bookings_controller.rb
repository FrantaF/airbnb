require 'date'
class BookingsController < ApplicationController
   before_action :require_login 

   def create      
      byebug
      params[:booking] = session["booking"]
      @booking = Booking.new(booking_params)
      
      
      
      if @booking.save
         # PostmanWorker.perform_later(current_user.id, params[:listing_id], @booking.id)

         #pass on the booking id for retrieval of payment info         
         redirect_to :root, :flash => { :success => "Transaction successful!" }         
      else
         # @listing = Listing.find(@booking.listing_id)
         # @errors = @booking.errors.full_messages
         # render 'listings/show'
         # redirect_to user_listing_path(@booking.user_id, @booking.listing_id)
         redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
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
      params.require(:booking).permit(:user_id, :listing_id, :start_date, :end_date :total_price)
   end

end
