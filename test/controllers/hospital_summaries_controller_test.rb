require 'test_helper'

class HospitalSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_summary = hospital_summaries(:one)
  end

  test "should get index" do
    get hospital_summaries_url, as: :json
    assert_response :success
  end

  test "should create hospital_summary" do
    assert_difference('HospitalSummary.count') do
      post hospital_summaries_url, params: { hospital_summary: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show hospital_summary" do
    get hospital_summary_url(@hospital_summary), as: :json
    assert_response :success
  end

  test "should update hospital_summary" do
    patch hospital_summary_url(@hospital_summary), params: { hospital_summary: {  } }, as: :json
    assert_response 200
  end

  test "should destroy hospital_summary" do
    assert_difference('HospitalSummary.count', -1) do
      delete hospital_summary_url(@hospital_summary), as: :json
    end

    assert_response 204
  end
end
