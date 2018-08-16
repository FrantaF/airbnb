class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.timestamps
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
   end
end
end
