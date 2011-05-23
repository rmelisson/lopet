require 'test_helper'

class AccionsControllerTest < ActionController::TestCase
  setup do
    @accion = accions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accion" do
    assert_difference('Accion.count') do
      post :create, :accion => @accion.attributes
    end

    assert_redirected_to accion_path(assigns(:accion))
  end

  test "should show accion" do
    get :show, :id => @accion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accion.to_param
    assert_response :success
  end

  test "should update accion" do
    put :update, :id => @accion.to_param, :accion => @accion.attributes
    assert_redirected_to accion_path(assigns(:accion))
  end

  test "should destroy accion" do
    assert_difference('Accion.count', -1) do
      delete :destroy, :id => @accion.to_param
    end

    assert_redirected_to accions_path
  end
end
