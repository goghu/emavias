require 'test_helper'

class CajasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caja = cajas(:one)
  end

  test "should get index" do
    get cajas_url
    assert_response :success
  end

  test "should get new" do
    get new_caja_url
    assert_response :success
  end

  test "should create caja" do
    assert_difference('Caja.count') do
      post cajas_url, params: { caja: { fecha: @caja.fecha, monto: @caja.monto, pago_id: @caja.pago_id, tipo: @caja.tipo, user_id: @caja.user_id } }
    end

    assert_redirected_to caja_url(Caja.last)
  end

  test "should show caja" do
    get caja_url(@caja)
    assert_response :success
  end

  test "should get edit" do
    get edit_caja_url(@caja)
    assert_response :success
  end

  test "should update caja" do
    patch caja_url(@caja), params: { caja: { fecha: @caja.fecha, monto: @caja.monto, pago_id: @caja.pago_id, tipo: @caja.tipo, user_id: @caja.user_id } }
    assert_redirected_to caja_url(@caja)
  end

  test "should destroy caja" do
    assert_difference('Caja.count', -1) do
      delete caja_url(@caja)
    end

    assert_redirected_to cajas_url
  end
end
