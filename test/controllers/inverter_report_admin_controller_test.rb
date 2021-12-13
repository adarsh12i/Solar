require 'test_helper'

class InverterReportAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get inv_rpt_admin_view" do
    get inverter_report_admin_inv_rpt_admin_view_url
    assert_response :success
  end

end
