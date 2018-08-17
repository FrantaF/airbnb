class CreateListings < ActiveRecord::Migration[5.1]
 def change
  create_table :listings do |t|
   t.string :description
   t.string :country
   t.string :city
   t.string :street

   t.date :available_from
   t.date :available_to

   t.integer :price_per_night
   t.integer :number_of_guests

   t.string :property_scope
   t.string :property_type   

   t.timestamps
   t.references :user, foreign_key: true
   t.references :amenity, foreign_key: true   
end


end
end

