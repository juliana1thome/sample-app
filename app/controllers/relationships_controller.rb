class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    # redirect_to user here the user is redirected to the page, which is not
    # necessary. Therefore, let's use Ajax to create an asynchronous request,
    # which will allow the user do his thing, while the request to follow or
    # unfollow is done
    respond_to do |format|
      format.html { redirect_to @user  }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    # redirect_to user
    respond_to do |format|
      format.html { redirect_to @user  }
      format.js
    end
  end
end
