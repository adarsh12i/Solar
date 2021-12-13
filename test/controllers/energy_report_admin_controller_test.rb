require 'test_helper'

class EnergyReportAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get energy_report_admin_view" do
    get energy_report_admin_energy_report_admin_view_url
    assert_response :success
  end

end
