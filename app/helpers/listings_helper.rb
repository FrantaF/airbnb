module ListingsHelper

   def style_listings(listing)   

   # NOTE: LISTING.IMAGE IS AN ARRAY!!! YOU ARE ONLY DISPLAYING THE FIRST PICTURE
   styled_listing = """
   <div class='row align-items-center justify-content-center' style='margin-top: 5%; margin-bottom: 5%;'>
   <div class='col-sm-12'>
   <div class='card'>      
   <img class='card-img-top listing-pic-on-profile-pg' src='#{listing.image}' style='' />      
   <div class='card-body'>
   <div class='col-md-6'>
   <p class='card-text'>#{listing.description} <br/> <a href='/listing/#{listing.id}'>View property</a></p>
   </div>
   <div class='col-md-6'>"""
   # STOP THE STRING HERE, RENDER RUBY CODE IN VIEW
   # RENDER THE REST OF THE STRINGTHROUGH ANOTHER METHOD
   #<%= render partial: 'listings/create_booking/' %>
   """<div class='form-group' style='margin-top: 2%;'> <div class='row'>

   <div class='col-md-6 form-group'>
   <label>Check In</label>
   <input type='date' class='form-control' id='inputCheckin' name='booking[start_date]'>
   </div>

   <div class='col-md-6 form-group'>
   <label>Check Out</label>
   <input type='date' class='form-control' id='inputCheckout' name='booking[end_date]'>
   </div>

   </div>
   </div>
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
