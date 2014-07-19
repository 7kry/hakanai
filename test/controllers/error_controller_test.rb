require 'test_helper'

class ErrorControllerTest < ActionController::TestCase
  test "should get please_login" do
    get :please_login
    assert_response :success
  end

end
