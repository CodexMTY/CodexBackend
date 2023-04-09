require "test_helper"

class EvaluacionesAnualesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluaciones_anuale = evaluaciones_anuales(:one)
  end

  test "should get index" do
    get evaluaciones_anuales_url, as: :json
    assert_response :success
  end

  test "should create evaluaciones_anuale" do
    assert_difference("EvaluacionesAnuale.count") do
      post evaluaciones_anuales_url, params: { evaluaciones_anuale: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show evaluaciones_anuale" do
    get evaluaciones_anuale_url(@evaluaciones_anuale), as: :json
    assert_response :success
  end

  test "should update evaluaciones_anuale" do
    patch evaluaciones_anuale_url(@evaluaciones_anuale), params: { evaluaciones_anuale: {  } }, as: :json
    assert_response :success
  end

  test "should destroy evaluaciones_anuale" do
    assert_difference("EvaluacionesAnuale.count", -1) do
      delete evaluaciones_anuale_url(@evaluaciones_anuale), as: :json
    end

    assert_response :no_content
  end
end
