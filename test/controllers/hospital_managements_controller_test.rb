require 'test_helper'

class HospitalManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_management = hospital_managements(:one)
  end

  test "should get index" do
    get hospital_managements_url, as: :json
    assert_response :success
  end

  test "should create hospital_management" do
    assert_difference('HospitalManagement.count') do
      post hospital_managements_url, params: { hospital_management: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital_management" do
    get hospital_management_url(@hospital_management), as: :json
    assert_response :success
  end

  test "should update hospital_management" do
    patch hospital_management_url(@hospital_management), params: { hospital_management: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital_management" do
    assert_difference('HospitalManagement.count', -1) do
      delete hospital_management_url(@hospital_management), as: :json
    end

    assert_response 204
  end
end
