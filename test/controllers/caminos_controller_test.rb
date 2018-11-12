require 'test_helper'

class CaminosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camino = caminos(:one)
  end

  test "should get index" do
    get caminos_url
    assert_response :success
  end

  test "should get new" do
    get new_camino_url
    assert_response :success
  end

  test "should create camino" do
    assert_difference('Camino.count') do
      post caminos_url, params: { camino: { alternativo: @camino.alternativo, correlativo: @camino.correlativo, unidade_id: @camino.unidade_id } }
    end

    assert_redirected_to camino_url(Camino.last)
  end

  test "should show camino" do
    get camino_url(@camino)
    assert_response :success
  end

  test "should get edit" do
    get edit_camino_url(@camino)
    assert_response :success
  end

  test "should update camino" do
    patch camino_url(@camino), params: { camino: { alternativo: @camino.alternativo, correlativo: @camino.correlativo, unidade_id: @camino.unidade_id } }
    assert_redirected_to camino_url(@camino)
  end

  test "should destroy camino" do
    assert_difference('Camino.count', -1) do
      delete camino_url(@camino)
    end

    assert_redirected_to caminos_url
  end
end
