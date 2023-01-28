require "test_helper"

class BedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beds_index_url
    assert_response :success
  end
end
