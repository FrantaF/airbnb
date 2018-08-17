class UsersController < Clearance::UsersController
   before_action :require_login, except: :create
   
   def create      

      @user= User.new(user_params)
      if @user.save
         sign_in(user)            
         redirect_to user_profile_path(user.id)
      else
         #specify there something to trigger JS 
         #which will then open the registration box rather than login box         
         redirect_to sign_in_path
      end
   end

   def show
   end

   def edit      
      # current_user.update(:birthdate => params[:user][:birthdate], :password params[:user][:password])
   end

   def update
      current_user.update(:avatar => params[:user][:avatar])
      redirect_to user_profile_path(current_user.id)
   end

   def profile            

      #Display user info
      @user_name = User.find(params[:id]).first_name + " " + User.find(params[:id]).last_name
      @description = current_user.description
      if @description == nil
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
      
   end

   private

   def user_params      
      params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password)
   end   
end