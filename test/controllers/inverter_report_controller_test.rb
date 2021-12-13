require 'test_helper'

class InverterReportControllerTest < ActionDispatch::IntegrationTest
  test "should get inverter_report_view" do
    get inverter_report_inverter_report_view_url
    assert_response :success
  end

end
