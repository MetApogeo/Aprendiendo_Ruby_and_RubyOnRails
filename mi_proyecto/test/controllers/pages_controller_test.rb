require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hola" do
    get pages_hola_url
    assert_response :success
  end
end
