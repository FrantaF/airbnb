class Amenity < ApplicationRecord
   has_and_belongs_to_many :listings   
end
