class SessionsController < ApplicationController
  def new
  end
  
  def create    
    # If the user credentials are authenticated.
    if user = User.authenticate_with_credentials(params[:email])
      # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, redirect to login page
      redirect_to '/login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
  
end
