require 'test_helper'

class NotasEntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notas_entrega = notas_entregas(:one)
  end

  test "should get index" do
    get notas_entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_notas_entrega_url
    assert_response :success
  end

  test "should create notas_entrega" do
    assert_difference('NotasEntrega.count') do
      post notas_entregas_url, params: { notas_entrega: { cliente_id: @notas_entrega.cliente_id, codigo: @notas_entrega.codigo, cuce: @notas_entrega.cuce, elaborado: @notas_entrega.elaborado, entregado: @notas_entrega.entregado, estado: @notas_entrega.estado, hora: @notas_entrega.hora, nombre: @notas_entrega.nombre, numero: @notas_entrega.numero, objeto: @notas_entrega.objeto, telefono: @notas_entrega.telefono } }
    end

    assert_redirected_to notas_entrega_url(NotasEntrega.last)
  end

  test "should show notas_entrega" do
    get notas_entrega_url(@notas_entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_notas_entrega_url(@notas_entrega)
    assert_response :success
  end

  test "should update notas_entrega" do
    patch notas_entrega_url(@notas_entrega), params: { notas_entrega: { cliente_id: @notas_entrega.cliente_id, codigo: @notas_entrega.codigo, cuce: @notas_entrega.cuce, elaborado: @notas_entrega.elaborado, entregado: @notas_entrega.entregado, estado: @notas_entrega.estado, hora: @notas_entrega.hora, nombre: @notas_entrega.nombre, numero: @notas_entrega.numero, objeto: @notas_entrega.objeto, telefono: @notas_entrega.telefono } }
    assert_redirected_to notas_entrega_url(@notas_entrega)
  end

  test "should destroy notas_entrega" do
    assert_difference('NotasEntrega.count', -1) do
      delete notas_entrega_url(@notas_entrega)
    end

    assert_redirected_to notas_entregas_url
  end
end
