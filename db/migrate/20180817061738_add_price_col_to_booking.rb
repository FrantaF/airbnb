class AddPriceColToBooking < ActiveRecord::Migration[5.1]
 
 def change
   add_column :bookings, :total_price, :string
end
end
