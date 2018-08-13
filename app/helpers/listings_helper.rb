module ListingsHelper

   def style_listings(listings)
      styled_listings = []
      listings.each do |listing| 
         styled_listing = '<div class="card" style="width: 18rem; margin-right: 2%; margin-bottom: 2%;">
         <img class="card-img-top" src="https://images.pexels.com/photos/259600/pexels-photo-259600.jpeg?cs=srgb&dl=architecture-facade-house-259600.jpg&fm=jpg" alt="Card image cap">
         <div class="card-body">
         <p class="card-text">' + listing.description + '</p>
         </div>
         </div>'
         
         styled_listings.push(styled_listing)
      end
      return styled_listings
   end

end
