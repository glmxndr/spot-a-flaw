require 'test_helper'

class FlagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flag" do
    assert_difference('Flag.count') do
      post :create, :flag => { }
    end

    assert_redirected_to flag_path(assigns(:flag))
  end

  test "should show flag" do
    get :show, :id => flags(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flags(:one).id
    assert_response :success
  end

  test "should update flag" do
    put :update, :id => flags(:one).id, :flag => { }
    assert_redirected_to flag_path(assigns(:flag))
  end

  test "should destroy flag" do
    assert_difference('Flag.count', -1) do
      delete :destroy, :id => flags(:one).id
    end

    assert_redirected_to flags_path
  end
end
