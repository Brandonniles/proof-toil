require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get weather" do
    get welcome_weather_url
    assert_response :success
  end

  test "should get blog" do
    get welcome_blog_url
    assert_response :success
  end

  test "should get store" do
    get welcome_store_url
    assert_response :success
  end

  test "should get map" do
    get welcome_map_url
    assert_response :success
  end

end
