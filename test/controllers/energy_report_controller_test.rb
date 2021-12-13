require 'test_helper'

class EnergyReportControllerTest < ActionDispatch::IntegrationTest
  test "should get energy_report_view" do
    get energy_report_energy_report_view_url
    assert_response :success
  end

end
