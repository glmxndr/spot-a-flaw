require 'test_helper'

class FallaciesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fallacies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fallacy" do
    assert_difference('Fallacy.count') do
      post :create, :fallacy => { }
    end

    assert_redirected_to fallacy_path(assigns(:fallacy))
  end

  test "should show fallacy" do
    get :show, :id => fallacies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fallacies(:one).id
    assert_response :success
  end

  test "should update fallacy" do
    put :update, :id => fallacies(:one).id, :fallacy => { }
    assert_redirected_to fallacy_path(assigns(:fallacy))
  end

  test "should destroy fallacy" do
    assert_difference('Fallacy.count', -1) do
      delete :destroy, :id => fallacies(:one).id
    end

    assert_redirected_to fallacies_path
  end
end
