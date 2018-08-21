module ListingsHelper

   def style_listings(listing)   

   # NOTE: LISTING.IMAGE IS AN ARRAY!!! YOU ARE ONLY DISPLAYING THE FIRST PICTURE
   styled_listing = """
   <div class='row align-items-center justify-content-center' style='margin-top: 5%; margin-bottom: 5%;'>
   <div class='col-sm-12'>
   <div class='card'>      
   <img class='card-img-top listing-pic-on-profile-pg' src='#{listing.image}' style='' />      
   <div class='row card-body'>
   <div class='row col-sm-12'>
   <h3> #{listing.title} </h3>
   </div>
   <div class='col-md-6'>
   <div class='row col-sm-12'>
   <div>  #{listing.property_scope} with a maximum of #{listing.number_of_guests} guests </div>   
   </div>
   <p class='card-text'>#{listing.description} <br/> <a href='/listing/#{listing.id}'>View property</a></p>
   </div>
   <div class='col-md-6'>"""   

   return styled_listing
end

def render_booking_form
   styled_string = """<div class='form-group' style='margin-top: 2%;'> <div class='row'>

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
   return styled_string
end


def generate_amenities
   options = ["TV", "Hairdryer", "Towels", "Dishwasher", "Microwave"]
   buttons = []
   counter = 0

   options.each do |option|
      button = "<div class='form-group' style='margin-right: 2%'>
      <label> #{option} </label>
      <div class='radio'>
      <input type='radio' value=#{option} name='amenity[option#{counter}]'>
      </div>
      </div>"
      buttons.push(button)
      counter += 1
   end
   return buttons

end

def upload_files
   str = """<!-- Upload Files: Hidden by default -->
   <div id='upload-files-area' class='container' style='display: none;'>
   <div class='panel panel-default'>
   <a href='#' onclick='hideUploadArea()' class='close file-upload-close' aria-label='close'>&times;</a>
   <div class='panel-heading'><strong>Upload Files</strong></div>      
   <div class='panel-body'>

   <!-- Standar Form -->
   <h4>Select files from your computer</h4>
   """

   # <%= form_for listings, url: '/listing/#{listing.id}', :html => {:class => 'profile-row-item', :id=>'js-upload-form', :enctype=>'multipart/form-data'}, method: "post" do |f| %>
   #    <div class='form-inline'>
   #    <div class='form-group'>

   #    <%= f.file_field :image, :html => {:name => 'files[]', :id=>'js-upload-files', :multiple} %> 
   #    </div>
   #    <%= f.submit "Upload Images" :html => {:class='btn btn-sm btn-primary', :id='js-upload-submit'}%>

   #    </div>
   #    </div>
   #    <% end %>

   #    <form action='' method='post' enctype='multipart/form-data' id='js-upload-form'>
   #    <div class='form-inline'>
   #    <div class='form-group'>
   #    <input type='file' name='files[]' id='js-upload-files' multiple>
   #    </div>
   #    <button type='submit' class='btn btn-sm btn-primary' id='js-upload-submit'>Upload files</button>
   #    </div>
   #    </form>

      # """<!-- Drop Zone -->
      # <h4>Or drag and drop files below</h4>
      # <div class='upload-drop-zone' id='drop-zone'>
      # Just drag and drop files here
      # </div>

      # <!-- Progress Bar -->
      # <div class='progress'>
      # <div class='progress-bar' role='progressbar' aria-valuenow='60' aria-valuemin='0' aria-valuemax='100' style='width: 60%;'>
      # <span class='sr-only'>60 Complete</span>
      # </div>
      # </div>

      # <!-- Upload Finished -->
      # <div class='js-upload-finished'>
      # <h3>Processed files</h3>
      # <div class='list-group'>
      # <a href='#' class='list-group-item list-group-item-success'><span class='badge alert-success pull-right'>Success</span>image-01.jpg</a>
      # <a href='#' class='list-group-item list-group-item-success'><span class='badge alert-success pull-right'>Success</span>image-02.jpg</a>
      # </div>
      # </div>
      # </div>
      # </div>
      # </div> <!-- /container -->
      # <!-- End of File Upload -->"""
      return str
   end
end
