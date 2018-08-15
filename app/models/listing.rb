class Listing < ApplicationRecord
   belongs_to :user
   has_and_belongs_to_many :amenities
   has_and_belongs_to_many :tags
   mount_uploader :image, AvatarUploader
end
