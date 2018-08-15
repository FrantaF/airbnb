class CreateBookings < ActiveRecord::Migration[5.1]
 def change
  create_table :bookings do |t|
   t.string :start_date
   t.string :end_date
   t.timestamps
end
end
end
