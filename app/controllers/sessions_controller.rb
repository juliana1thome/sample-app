class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # Recall that email addresses are saved as all lowercase, so here we use the downcase method to ensure a match when the submitted address is valid
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else # Give the user an error messsage, and render new page again
      flash.now[:danger] = 'Invalid email/password combination ( ≖_≖)' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
