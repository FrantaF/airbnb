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

   def login
   end

   def edit
      #handle update of user info here i.e. set birthdate and pswd after google authentication

   end

   private

   def user_params      
      params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password)
   end   
end