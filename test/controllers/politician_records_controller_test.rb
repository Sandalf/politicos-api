require "test_helper"

class PoliticianRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @politician_record = politician_records(:one)
  end

  test "should get index" do
    get politician_records_url, as: :json
    assert_response :success
  end

  test "should create politician_record" do
    assert_difference("PoliticianRecord.count") do
      post politician_records_url, params: { politician_record: { description: @politician_record.description, end_date: @politician_record.end_date, start_date: @politician_record.start_date, type: @politician_record.type } }, as: :json
    end

    assert_response :created
  end

  test "should show politician_record" do
    get politician_record_url(@politician_record), as: :json
    assert_response :success
  end

  test "should update politician_record" do
    patch politician_record_url(@politician_record), params: { politician_record: { description: @politician_record.description, end_date: @politician_record.end_date, start_date: @politician_record.start_date, type: @politician_record.type } }, as: :json
    assert_response :success
  end

  test "should destroy politician_record" do
    assert_difference("PoliticianRecord.count", -1) do
      delete politician_record_url(@politician_record), as: :json
    end

    assert_response :no_content
  end
end
