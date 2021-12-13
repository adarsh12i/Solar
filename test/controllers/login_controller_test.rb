require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login_view" do
    get login_login_view_url
    assert_response :success
  end

end
