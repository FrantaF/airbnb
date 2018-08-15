class Booking < ApplicationRecord
   belongs_to :user, dependent: :destroy
   has_many :users, dependent: :destroy
end
