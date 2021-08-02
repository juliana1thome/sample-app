module SessionsHelper
  # Note helpers are used in views with intention to share reusable code 
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
      # ||= means that if @current_user is nill make it equal User.find_by(***)
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
   def log_out
     session.delete(:user_id)
     @current_user = nil
   end
end
