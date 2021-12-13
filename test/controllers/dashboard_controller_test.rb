require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard_view" do
    get dashboard_dashboard_view_url
    assert_response :success
  end

end
