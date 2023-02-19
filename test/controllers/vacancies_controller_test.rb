require "test_helper"

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  setup { @facility = facilities(:one) }

  test "should show vacancies" do
    get facility_vacancies_url(@facility)
    assert_response :success
  end
end
