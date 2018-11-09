require 'test_helper'

class RangosPreciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rangos_precio = rangos_precios(:one)
  end

  test "should get index" do
    get rangos_precios_url
    assert_response :success
  end

  test "should get new" do
    get new_rangos_precio_url
    assert_response :success
  end

  test "should create rangos_precio" do
    assert_difference('RangosPrecio.count') do
      post rangos_precios_url, params: { rangos_precio: { borrado: @rangos_precio.borrado, maximo: @rangos_precio.maximo, minimo: @rangos_precio.minimo, precio: @rangos_precio.precio, producto_id: @rangos_precio.producto_id } }
    end

    assert_redirected_to rangos_precio_url(RangosPrecio.last)
  end

  test "should show rangos_precio" do
    get rangos_precio_url(@rangos_precio)
    assert_response :success
  end

  test "should get edit" do
    get edit_rangos_precio_url(@rangos_precio)
    assert_response :success
  end

  test "should update rangos_precio" do
    patch rangos_precio_url(@rangos_precio), params: { rangos_precio: { borrado: @rangos_precio.borrado, maximo: @rangos_precio.maximo, minimo: @rangos_precio.minimo, precio: @rangos_precio.precio, producto_id: @rangos_precio.producto_id } }
    assert_redirected_to rangos_precio_url(@rangos_precio)
  end

  test "should destroy rangos_precio" do
    assert_difference('RangosPrecio.count', -1) do
      delete rangos_precio_url(@rangos_precio)
    end

    assert_redirected_to rangos_precios_url
  end
end
