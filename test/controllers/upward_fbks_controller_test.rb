require "test_helper"

class UpwardFbksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upward_fbk = upward_fbks(:one)
  end

  test "should get index" do
    get upward_fbks_url, as: :json
    assert_response :success
  end

  test "should create upward_fbk" do
    assert_difference("UpwardFbk.count") do
      post upward_fbks_url, params: { upward_fbk: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show upward_fbk" do
    get upward_fbk_url(@upward_fbk), as: :json
    assert_response :success
  end

  test "should update upward_fbk" do
    patch upward_fbk_url(@upward_fbk), params: { upward_fbk: {  } }, as: :json
    assert_response :success
  end

  test "should destroy upward_fbk" do
    assert_difference("UpwardFbk.count", -1) do
      delete upward_fbk_url(@upward_fbk), as: :json
    end

    assert_response :no_content
  end
end
