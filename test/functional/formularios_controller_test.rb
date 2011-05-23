require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  setup do
    @formulario = formularios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formularios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulario" do
    assert_difference('Formulario.count') do
      post :create, :formulario => @formulario.attributes
    end

    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should show formulario" do
    get :show, :id => @formulario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @formulario.to_param
    assert_response :success
  end

  test "should update formulario" do
    put :update, :id => @formulario.to_param, :formulario => @formulario.attributes
    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should destroy formulario" do
    assert_difference('Formulario.count', -1) do
      delete :destroy, :id => @formulario.to_param
    end

    assert_redirected_to formularios_path
  end
end
