module ListingsHelper
# <%=image_tag(listing.image, :class => 'card-img-top')%>
# https://images.pexels.com/photos/259600/pexels-photo-259600.jpeg?cs=srgb&dl=architecture-facade-house-259600.jpg&fm=jpg' alt='Card image cap
# <img class='card-img-top' src='#{listing.image}'>
def style_listings(listings)   
   styled_listings = []
   listings.each do |listing| 
      # NOTE: LISTING.IMAGE IS AN ARRAY!!! YOU ARE ONLY DISPLAYING THE FIRST PICTURE
      styled_listing = """
      <div class='card' style='width: 18rem; margin-right: 2%; margin-bottom: 2%;'>      
      <img class='card-img-top' src='#{listing.image}' />      
      <div class='card-body'>
      <p class='card-text'>#{listing.description}</p>
      <a href='/listing/#{listing.id}'>link</a>
      </div>
      </div>
      """

      styled_listings.push(styled_listing)
   end
   return styled_listings
end

def generate_tags
   options = ["smoker", "non-smoker", "has pets", "late coder", "nice person"]
   buttons = []
   counter = 0

   options.each do |option|
      button = "<div class='form-group' style='margin-right: 2%'>
      <label> #{option} </label>
      <div class='radio'>
      <input type='radio' name='user[option#{counter}]'>
      </div>
      </div>"
      buttons.push(button)
      counter += 1
   end
   return buttons
end

def generate_amenities
   options = ["TV", "Hairdryer", "Towels", "Dishwasher", "Microwave"]
   buttons = []
   counter = 0

   options.each do |option|
      button = "<div class='form-group' style='margin-right: 2%'>
      <label> #{option} </label>
      <div class='radio'>
      <input type='radio' name='user[option#{counter}]'>
      </div>
      </div>"
      buttons.push(button)
      counter += 1
   end
   return buttons



end

end
