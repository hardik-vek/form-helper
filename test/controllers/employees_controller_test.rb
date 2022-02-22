require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get employees_search_url
    assert_response :success
  end
end
