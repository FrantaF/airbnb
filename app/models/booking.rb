require 'date'
class Booking < ApplicationRecord
   #Db
   belongs_to :user, dependent: :destroy
   belongs_to :listing, dependent: :destroy   
   enum payment: [:unpaid, :paid]

   #Validators
   validate :check_overlapping_dates
   #validate :check_max_guests
   validates :start_date, presence: true
   validates :end_date, presence: true
   validates :total_price, presence: true

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
   # Add a condition that you cant book yesterday, end_date must be bigger than start    
   x_start = Date.parse(x.start_date)
   x_end = Date.parse(x.end_date)
   y_start = Date.parse(y.start_date)
   y_end = Date.parse(y.end_date)

   
   
   #validate start_date > current.date and start<end
   if x_start < DateTime.now
      return true
   elsif x_end > x_end
      return true
   end 

   (x_start - y_end) * (y_start - x_end) > 0
end

# def check_max_guests   
#    max_guests = listing.number_of_guests
#    return if session["booking"][:num_guests] < max_guests
#    errors.add(:max_guests, "The guest number exeeded ")
# end


end