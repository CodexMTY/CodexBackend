require "test_helper"

class ClienteProveedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente_proveedor = cliente_proveedors(:one)
  end

  test "should get index" do
    get cliente_proveedors_url, as: :json
    assert_response :success
  end

  test "should create cliente_proveedor" do
    assert_difference("ClienteProveedor.count") do
      post cliente_proveedors_url, params: { cliente_proveedor: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show cliente_proveedor" do
    get cliente_proveedor_url(@cliente_proveedor), as: :json
    assert_response :success
  end

  test "should update cliente_proveedor" do
    patch cliente_proveedor_url(@cliente_proveedor), params: { cliente_proveedor: {  } }, as: :json
    assert_response :success
  end

  test "should destroy cliente_proveedor" do
    assert_difference("ClienteProveedor.count", -1) do
      delete cliente_proveedor_url(@cliente_proveedor), as: :json
    end

    assert_response :no_content
  end
end
