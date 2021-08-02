class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # If you want to debug use debugger. Don't forget that it needs the byebug gem
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(params[:user]) | Instead making the site super vunerable
    # like this, wich will make possible any user become admin. We use a better
    # version
    @user = User.new(user_params)
    if @user.save # Handle a successful save.
      log_in @user
      flash[:sucess] = "Welcome to my WONDERFUL Sample App ʕ•́ᴥ•̀ʔっ"
      redirect_to @user
    else
      render 'new' # render the page new so the user can try again
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    # the extra level of indentation on the
    # user_params method is designed to make it visually
    # apparent which methods are defined after private.
  end

end
