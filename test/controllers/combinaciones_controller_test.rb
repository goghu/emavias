require 'test_helper'

class CombinacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @combinacione = combinaciones(:one)
  end

  test "should get index" do
    get combinaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_combinacione_url
    assert_response :success
  end

  test "should create combinacione" do
    assert_difference('Combinacione.count') do
      post combinaciones_url, params: { combinacione: { precio: @combinacione.precio, productoa_id: @combinacione.productoa_id, productob_id: @combinacione.productob_id } }
    end

    assert_redirected_to combinacione_url(Combinacione.last)
  end

  test "should show combinacione" do
    get combinacione_url(@combinacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_combinacione_url(@combinacione)
    assert_response :success
  end

  test "should update combinacione" do
    patch combinacione_url(@combinacione), params: { combinacione: { precio: @combinacione.precio, productoa_id: @combinacione.productoa_id, productob_id: @combinacione.productob_id } }
    assert_redirected_to combinacione_url(@combinacione)
  end

  test "should destroy combinacione" do
    assert_difference('Combinacione.count', -1) do
      delete combinacione_url(@combinacione)
    end

    assert_redirected_to combinaciones_url
  end
end
