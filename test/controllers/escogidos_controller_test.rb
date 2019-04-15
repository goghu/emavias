require 'test_helper'

class EscogidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escogido = escogidos(:one)
  end

  test "should get index" do
    get escogidos_url
    assert_response :success
  end

  test "should get new" do
    get new_escogido_url
    assert_response :success
  end

  test "should create escogido" do
    assert_difference('Escogido.count') do
      post escogidos_url, params: { escogido: { memo_id: @escogido.memo_id, user_id: @escogido.user_id } }
    end

    assert_redirected_to escogido_url(Escogido.last)
  end

  test "should show escogido" do
    get escogido_url(@escogido)
    assert_response :success
  end

  test "should get edit" do
    get edit_escogido_url(@escogido)
    assert_response :success
  end

  test "should update escogido" do
    patch escogido_url(@escogido), params: { escogido: { memo_id: @escogido.memo_id, user_id: @escogido.user_id } }
    assert_redirected_to escogido_url(@escogido)
  end

  test "should destroy escogido" do
    assert_difference('Escogido.count', -1) do
      delete escogido_url(@escogido)
    end

    assert_redirected_to escogidos_url
  end
end
