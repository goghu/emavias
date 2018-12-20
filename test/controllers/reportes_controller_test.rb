require 'test_helper'

class ReportesControllerTest < ActionDispatch::IntegrationTest
  test "should get tramites" do
    get reportes_tramites_url
    assert_response :success
  end

  test "should get fechas" do
    get reportes_fechas_url
    assert_response :success
  end

end
