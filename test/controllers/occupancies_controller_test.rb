require "test_helper"

class OccupanciesControllerTest < ActionDispatch::IntegrationTest
  test "should get terminate" do
    get occupancies_terminate_url
    assert_response :success
  end
end
