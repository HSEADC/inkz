require "test_helper"

class SupportControllerTest < ActionDispatch::IntegrationTest
  test "should get request_support" do
    get support_request_support_url
    assert_response :success
  end
end
