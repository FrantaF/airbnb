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
      # render "profile"
   end

   def edit      
      # current_user.update(:birthdate => params[:user][:birthdate], :password params[:user][:password])
   end

   def update
      current_user.update(:avatar => params[:user][:avatar])
      redirect_to user_profile_path(current_user.id)
   end

   def profile      
      User.find(params[:id])
   end

   private

   def user_params      
      params.require(:user).permit(:avatar, :email, :first_name, :last_name, :birthdate, :password)
   end   
end