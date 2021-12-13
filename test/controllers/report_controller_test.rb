require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get report_view" do
    get report_report_view_url
    assert_response :success
  end

end
