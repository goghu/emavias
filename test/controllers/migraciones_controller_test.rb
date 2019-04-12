require 'test_helper'

class MigracionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @migracione = migraciones(:one)
  end

  test "should get index" do
    get migraciones_url
    assert_response :success
  end

  test "should get new" do
    get new_migracione_url
    assert_response :success
  end

  test "should create migracione" do
    assert_difference('Migracione.count') do
      post migraciones_url, params: { migracione: { cite: @migracione.cite, documento: @migracione.documento, fecha: @migracione.fecha } }
    end

    assert_redirected_to migracione_url(Migracione.last)
  end

  test "should show migracione" do
    get migracione_url(@migracione)
    assert_response :success
  end

  test "should get edit" do
    get edit_migracione_url(@migracione)
    assert_response :success
  end

  test "should update migracione" do
    patch migracione_url(@migracione), params: { migracione: { cite: @migracione.cite, documento: @migracione.documento, fecha: @migracione.fecha } }
    assert_redirected_to migracione_url(@migracione)
  end

  test "should destroy migracione" do
    assert_difference('Migracione.count', -1) do
      delete migracione_url(@migracione)
    end

    assert_redirected_to migraciones_url
  end
end
