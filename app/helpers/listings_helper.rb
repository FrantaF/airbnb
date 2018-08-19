module ListingsHelper
# <%=image_tag(listing.image, :class => 'card-img-top')%>
# https://images.pexels.com/photos/259600/pexels-photo-259600.jpeg?cs=srgb&dl=architecture-facade-house-259600.jpg&fm=jpg' alt='Card image cap
# <img class='card-img-top' src='#{listing.image}'>
def style_listings(listing)   

   # NOTE: LISTING.IMAGE IS AN ARRAY!!! YOU ARE ONLY DISPLAYING THE FIRST PICTURE
   styled_listing = """
   <div class='row align-items-center justify-content-center' style='margin-top: 5%; margin-bottom: 5%;'>
   <div class='col-sm-12'>
   <div class='card'>      
   <img class='card-img-top' src='#{listing.image}' />      
   <div class='card-body'>
   <p class='card-text'>#{listing.description}</p>
   <a href='/listing/#{listing.id}'>link</a>
   </div>
   </div>
   </div>
   </div>
   <hr>

   """

   return styled_listing
end


def generate_amenities
   options = ["TV", "Hairdryer", "Towels", "Dishwasher", "Microwave"]
   buttons = []
   counter = 0

   options.each do |option|
      button = "<div class='form-group' style='margin-right: 2%'>
      <label> #{option} </label>
      <div class='radio'>
      <input type='radio' name='amenity[option#{counter}]'>
      </div>
      </div>"
      buttons.push(button)
      counter += 1
   end
   return buttons



end

end
