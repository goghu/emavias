require 'test_helper'

class DocderivacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docderivacione = docderivaciones(:one)
  end

  test "should get index" do
    get docderivaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_docderivacione_url
    assert_response :success
  end

  test "should create docderivacione" do
    assert_difference('Docderivacione.count') do
      post docderivaciones_url, params: { docderivacione: { camino_id: @docderivacione.camino_id, descripcion: @docderivacione.descripcion, docvalor: @docderivacione.docvalor, estado: @docderivacione.estado, presento: @docderivacione.presento } }
    end

    assert_redirected_to docderivacione_url(Docderivacione.last)
  end

  test "should show docderivacione" do
    get docderivacione_url(@docderivacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_docderivacione_url(@docderivacione)
    assert_response :success
  end

  test "should update docderivacione" do
    patch docderivacione_url(@docderivacione), params: { docderivacione: { camino_id: @docderivacione.camino_id, descripcion: @docderivacione.descripcion, docvalor: @docderivacione.docvalor, estado: @docderivacione.estado, presento: @docderivacione.presento } }
    assert_redirected_to docderivacione_url(@docderivacione)
  end

  test "should destroy docderivacione" do
    assert_difference('Docderivacione.count', -1) do
      delete docderivacione_url(@docderivacione)
    end

    assert_redirected_to docderivaciones_url
  end
end
