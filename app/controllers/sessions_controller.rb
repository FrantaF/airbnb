  class SessionsController < Clearance::SessionsController

    def create_from_omniauth    
      auth_hash = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      
      sign_in(user)
      redirect_to listings_search_box_path 
    else        
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      sign_in(user)            
      redirect_to users_profile_path(user.id)
    end

  end  

  def login    
    @display_carousel = true    
    if signed_in?
      redirect_to listings_search_box_path
    end
  end

  def destroy    
    sign_out
    redirect_to root_url
  end


end