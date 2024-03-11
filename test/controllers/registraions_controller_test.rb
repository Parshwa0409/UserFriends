require "test_helper"

class RegistraionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registraions_new_url
    assert_response :success
  end

  test "should get create" do
    get registraions_create_url
    assert_response :success
  end
end
