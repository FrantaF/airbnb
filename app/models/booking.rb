class Booking < ApplicationRecord
   belongs_to :user, dependent: :destroy
   belongs_to :listing, dependent: :destroy   
end
