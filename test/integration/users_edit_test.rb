require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:juliana)
  end

  test "unsuccessfull edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name =  "Ju Tho"
    email = "ju@ju.com"
    patch user_path(@user), params:{user: {name: name, email: email, password: "", password_confirmation: ""}} # Note that the password is in blanc. The reason for this is that the user could want to update other informations without updating the pass...
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
