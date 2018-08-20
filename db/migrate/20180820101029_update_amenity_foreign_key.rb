class UpdateAmenityForeignKey < ActiveRecord::Migration[5.1]
  def change
   add_reference :amenities, :listing, index: true
end
end
