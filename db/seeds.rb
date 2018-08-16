# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'pswd'

ActiveRecord::Base.transaction do
 20.times do 
   user['description'] = Faker::Hipster.sentence
   user['first_name'] = Faker::Name.first_name 
   user['last_name'] = Faker::Name.last_name
   user['email'] = Faker::Internet.email      
   user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
   user['role'] = [0,1].sample
   User.create(user)
 end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
 40.times do 
   listing['description'] = Faker::Hipster.sentence     
   listing['country'] = Faker::Address.country
   listing['city'] = Faker::Address.city
   listing['street'] = Faker::Address.street_address

   listing['property_scope'] = ["Entire", "Private", "Shared"].sample
   listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Chalet", "Hut", "Tent", "Other"].sample
   listing['price_per_night'] = rand(80..500)
   listing['user_id'] = uids.sample     
   Listing.create(listing)
 end
end

#Create specific listings for testing
#Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  10.times do 
   listing['description'] = Faker::Hipster.sentence     
   listing['country'] = "Malaysia"
   listing['city'] = "KL"
   listing['street'] = Faker::Address.street_address

   listing['property_scope'] = ["Entire", "Private", "Shared"].sample
   listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Chalet", "Hut", "Tent", "Other"].sample
   listing['price_per_night'] = rand(80..500)
   listing['user_id'] = uids.sample
   Listing.create(listing)
 end
end

