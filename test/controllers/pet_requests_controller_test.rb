require 'test_helper'

class PetRequestsControllerTest < ActionController::TestCase
  setup do
    @pet_request = pet_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_request" do
    assert_difference('PetRequest.count') do
      post :create, pet_request: { color_id: @pet_request.color_id, conversion_state_id: @pet_request.conversion_state_id, creator_id: @pet_request.creator_id, info: @pet_request.info, minimum_name_quality_id: @pet_request.minimum_name_quality_id, requires_clothes: @pet_request.requires_clothes, species_id: @pet_request.species_id }
    end

    assert_redirected_to pet_request_path(assigns(:pet_request))
  end

  test "should show pet_request" do
    get :show, id: @pet_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_request
    assert_response :success
  end

  test "should update pet_request" do
    patch :update, id: @pet_request, pet_request: { color_id: @pet_request.color_id, conversion_state_id: @pet_request.conversion_state_id, creator_id: @pet_request.creator_id, info: @pet_request.info, minimum_name_quality_id: @pet_request.minimum_name_quality_id, requires_clothes: @pet_request.requires_clothes, species_id: @pet_request.species_id }
    assert_redirected_to pet_request_path(assigns(:pet_request))
  end

  test "should destroy pet_request" do
    assert_difference('PetRequest.count', -1) do
      delete :destroy, id: @pet_request
    end

    assert_redirected_to pet_requests_path
  end
end
