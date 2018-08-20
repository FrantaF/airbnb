class UsersController < Clearance::UsersController
   before_action :require_login, except: :create
   
   def create      

      @user = User.new(user_params)
      @user.role = 0
      
      if @user.save
         sign_in(@user)            
         redirect_to user_profile_path(@user.id)
      else
         #specify there something to trigger JS 
         #which will then open the registration box rather than login box         
         redirect_to sign_in_path
      end
   end

   def show
   end

   def update_description
      current_user.description = params[:user][:description]
      current_user.save       
      redirect_to user_profile_path(current_user.id)
   end

   def edit      
      # current_user.update(:birthdate => params[:user][:birthdate], :password params[:user][:password])
   end

   def update
      current_user.update(avatar: params[:user][:avatar])     
      redirect_to user_profile_path(current_user.id)
   end

   def profile      
      #Display user info
      @user_name = User.find(params[:id]).first_name + " " + User.find(params[:id]).last_name
      @user_first_name = User.find(params[:id]).first_name
      @description = current_user.description

      if @description == nil or @description == ""
         @description = "Tell a story about yourself ..."
      end      
      

      #Display property hosted by the user
      user_listings = Listing.where("user_id = ?", "#{params[:id]}")
      if  !user_listings[0].nil?
         @has_listings = true
         listing = Listing.where("user_id = ?", "#{current_user.id}")
         @listings = listing         
      else
         @has_listings = false
      end

      @booking_form = render_booking_form
      
   end

   private

   def user_params    
     # user_params ||= params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password, :avatar, :role, :description)
     params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password, :avatar, :role, :description)
  end   
end