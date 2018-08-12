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

   def edit
      #SET USR PASSWORD AND BIRTHDATE HERE
      current_user.update(:birthdate => ...., :encrypted_password => ....)
   end

   private

   def user_params      
      params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :password)
   end   
end