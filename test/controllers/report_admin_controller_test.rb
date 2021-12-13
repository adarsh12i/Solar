require 'test_helper'

class ReportAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get report_admin_view" do
    get report_admin_report_admin_view_url
    assert_response :success
  end

end
