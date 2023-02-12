require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              password: "foo",
                                              password_confirmation: "bar" }}
    assert_template 'users/edit'
    assert_select "div.alert", "The form contains 4 errors."
  end

  test "successful edit with friendly forwarding do" do
    #send get request to edit_user_path(@user)
    get edit_user_path(@user)
    #return true when session and edit_user_url(@user) are the same
    assert_equal session[:forwarding_url], edit_user_url(@user)
    # log in as @user
    log_in_as(@user)
    #return true when session[:forwarding_url] is nil
    assert_nil session[:forwarding_url]
    #redirect to edit_user_url for @user
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
