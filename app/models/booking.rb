class Booking < ApplicationRecord
   belongs_to :user, dependent: :destroy
   has_one :listing, dependent: :destroy
end
