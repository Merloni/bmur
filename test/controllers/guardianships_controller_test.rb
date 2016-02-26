require 'test_helper'

class GuardianshipsControllerTest < ActionController::TestCase
  setup do
    @guardianship = guardianships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guardianships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guardianship" do
    assert_difference('Guardianship.count') do
      post :create, guardianship: { endtime: @guardianship.endtime }
    end

    assert_redirected_to guardianship_path(assigns(:guardianship))
  end

  test "should show guardianship" do
    get :show, id: @guardianship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guardianship
    assert_response :success
  end

  test "should update guardianship" do
    patch :update, id: @guardianship, guardianship: { endtime: @guardianship.endtime }
    assert_redirected_to guardianship_path(assigns(:guardianship))
  end

  test "should destroy guardianship" do
    assert_difference('Guardianship.count', -1) do
      delete :destroy, id: @guardianship
    end

    assert_redirected_to guardianships_path
  end
end
