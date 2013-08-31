require 'test_helper'

class RibbitmsgsControllerTest < ActionController::TestCase
  setup do
    @ribbitmsg = ribbitmsgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ribbitmsgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ribbitmsg" do
    assert_difference('Ribbitmsg.count') do
      post :create, ribbitmsg: { content: @ribbitmsg.content, references: @ribbitmsg.references }
    end

    assert_redirected_to ribbitmsg_path(assigns(:ribbitmsg))
  end

  test "should show ribbitmsg" do
    get :show, id: @ribbitmsg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ribbitmsg
    assert_response :success
  end

  test "should update ribbitmsg" do
    patch :update, id: @ribbitmsg, ribbitmsg: { content: @ribbitmsg.content, references: @ribbitmsg.references }
    assert_redirected_to ribbitmsg_path(assigns(:ribbitmsg))
  end

  test "should destroy ribbitmsg" do
    assert_difference('Ribbitmsg.count', -1) do
      delete :destroy, id: @ribbitmsg
    end

    assert_redirected_to ribbitmsgs_path
  end
end
