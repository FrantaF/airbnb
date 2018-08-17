require 'date'
class Booking < ApplicationRecord
   belongs_to :user, dependent: :destroy
   belongs_to :listing, dependent: :destroy   
   validate :check_overlapping_dates
   # validate :check_max_guests
   enum payment: [:unpaid, :paid]

   def check_overlapping_dates  
      bookings = Booking.where(listing_id: self.listing_id)
      bookings.each do |old_booking|         
         if overlap?(self, old_booking)
            errors.add(:overlapping_dates, "The booking dates conflict with existing bookings")            
         end

         
      end
      #might want to return something here      

   end

   def overlap?(x,y)         

      x_start = Date.parse(x.start_date)
      x_end = Date.parse(x.end_date)
      y_start = Date.parse(y.start_date)
      y_end = Date.parse(y.end_date)

      # byebug
      (x_start - y_end) * (y_start - x_end) > 0
   end

   def check_max_guests
      max_guests = listing.guest_number
      return if num_guests < max_guests
      errors.add(:max_guests, "The guest number exeeded ")
   end


end