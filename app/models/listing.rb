class Listing < ApplicationRecord
   belongs_to :user
   has_many :amenities   
   has_many :bookings, dependent: :destroy
   mount_uploader :image, AvatarUploader
end
