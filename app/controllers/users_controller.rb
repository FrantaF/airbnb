class UsersController < Clearance::UsersController

   def create      

      @user= User.new(user_params)
      if @user.save
         redirect_to sign_in_path
      else
         # given that I have the smae view file  for login/registration
         # you can create cookie/session var here to either load the reigstration box 
         # ir display a message informing about a failed  transaciton
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
      id = params[:id]
      @user_name = User.find(id).first_name + " " + User.find(id).last_name
      @description = current_user.description
      if @description == nil
         @description = "Brief description of the user ..."
      end
      
      
      user_listings = Listing.where("user_id = ?", "#{params[:id]}")
      if  !user_listings[0].nil?
         @has_listings = true
         listing = Listing.where("user_id = ?", "#{current_user.id}")
         @listings = listing
         #@listings = style_listings(listing)
      else
         @has_listings = false
      end
      
   end

   private

   def user_params      
      params.require(:user).permit(:avatar, :email, :first_name, :last_name, :birthdate, :password)
   end   
end