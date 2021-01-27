require 'test_helper'

class HospitalVendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_vendor = hospital_vendors(:one)
  end

  test "should get index" do
    get hospital_vendors_url, as: :json
    assert_response :success
  end

  test "should create hospital_vendor" do
    assert_difference('HospitalVendor.count') do
      post hospital_vendors_url, params: { hospital_vendor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital_vendor" do
    get hospital_vendor_url(@hospital_vendor), as: :json
    assert_response :success
  end

  test "should update hospital_vendor" do
    patch hospital_vendor_url(@hospital_vendor), params: { hospital_vendor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital_vendor" do
    assert_difference('HospitalVendor.count', -1) do
      delete hospital_vendor_url(@hospital_vendor), as: :json
    end

    assert_response 204
  end
end
