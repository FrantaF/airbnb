class Listing < ApplicationRecord
   #Db
   belongs_to :user
   has_many :amenities   
   has_many :bookings, dependent: :destroy
   accepts_nested_attributes_for :amenities

   #validators   
   mount_uploader :image, AvatarUploader
   validates :description, presence: true
   validates :country, presence: true
   validates :city, presence: true
   validates :street, presence: true
   validates :price_per_night, presence: true
   validates :number_of_guests, presence: true   
   validates :property_scope, presence: true   
   validates :property_type, presence: true   
   
end
