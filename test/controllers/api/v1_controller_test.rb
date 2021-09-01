require 'test_helper'

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get api_v1_news_url
    assert_response :success
  end

end
