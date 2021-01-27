require 'test_helper'

class HospitalCommunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_community = hospital_communities(:one)
  end

  test "should get index" do
    get hospital_communities_url, as: :json
    assert_response :success
  end

  test "should create hospital_community" do
    assert_difference('HospitalCommunity.count') do
      post hospital_communities_url, params: { hospital_community: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital_community" do
    get hospital_community_url(@hospital_community), as: :json
    assert_response :success
  end

  test "should update hospital_community" do
    patch hospital_community_url(@hospital_community), params: { hospital_community: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital_community" do
    assert_difference('HospitalCommunity.count', -1) do
      delete hospital_community_url(@hospital_community), as: :json
    end

    assert_response 204
  end
end
