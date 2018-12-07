require 'test_helper'

class AlternativosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alternativo = alternativos(:one)
  end

  test "should get index" do
    get alternativos_url
    assert_response :success
  end

  test "should get new" do
    get new_alternativo_url
    assert_response :success
  end

  test "should create alternativo" do
    assert_difference('Alternativo.count') do
      post alternativos_url, params: { alternativo: { alternativo_id: @alternativo.alternativo_id, estado: @alternativo.estado, obs: @alternativo.obs, ruta_id: @alternativo.ruta_id } }
    end

    assert_redirected_to alternativo_url(Alternativo.last)
  end

  test "should show alternativo" do
    get alternativo_url(@alternativo)
    assert_response :success
  end

  test "should get edit" do
    get edit_alternativo_url(@alternativo)
    assert_response :success
  end

  test "should update alternativo" do
    patch alternativo_url(@alternativo), params: { alternativo: { alternativo_id: @alternativo.alternativo_id, estado: @alternativo.estado, obs: @alternativo.obs, ruta_id: @alternativo.ruta_id } }
    assert_redirected_to alternativo_url(@alternativo)
  end

  test "should destroy alternativo" do
    assert_difference('Alternativo.count', -1) do
      delete alternativo_url(@alternativo)
    end

    assert_redirected_to alternativos_url
  end
end
