class Amenities < ActiveRecord::Migration[5.1]
 def change
   create_table :amenities do |t|
      t.string :amenity
   end

end
end
