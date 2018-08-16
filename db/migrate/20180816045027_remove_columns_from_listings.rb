class RemoveColumnsFromListings < ActiveRecord::Migration[5.1]
 def change   
   remove_column :listings, :available_from, :date
   remove_column :listings, :available_to, :date
end
end
