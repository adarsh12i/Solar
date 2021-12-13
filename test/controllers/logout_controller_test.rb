require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  test "should get logout_view" do
    get logout_logout_view_url
    assert_response :success
  end

end
