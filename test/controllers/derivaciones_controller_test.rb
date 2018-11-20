require 'test_helper'

class DerivacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @derivacione = derivaciones(:one)
  end

  test "should get index" do
    get derivaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_derivacione_url
    assert_response :success
  end

  test "should create derivacione" do
    assert_difference('Derivacione.count') do
      post derivaciones_url, params: { derivacione: { estado: @derivacione.estado, fecha: @derivacione.fecha, observaciones: @derivacione.observaciones, unidadd_id: @derivacione.unidadd_id, unidadeo_id: @derivacione.unidadeo_id, userd_id: @derivacione.userd_id, usero_id: @derivacione.usero_id } }
    end

    assert_redirected_to derivacione_url(Derivacione.last)
  end

  test "should show derivacione" do
    get derivacione_url(@derivacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_derivacione_url(@derivacione)
    assert_response :success
  end

  test "should update derivacione" do
    patch derivacione_url(@derivacione), params: { derivacione: { estado: @derivacione.estado, fecha: @derivacione.fecha, observaciones: @derivacione.observaciones, unidadd_id: @derivacione.unidadd_id, unidadeo_id: @derivacione.unidadeo_id, userd_id: @derivacione.userd_id, usero_id: @derivacione.usero_id } }
    assert_redirected_to derivacione_url(@derivacione)
  end

  test "should destroy derivacione" do
    assert_difference('Derivacione.count', -1) do
      delete derivacione_url(@derivacione)
    end

    assert_redirected_to derivaciones_url
  end
end
