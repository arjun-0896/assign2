require 'test_helper'

class GifControllerTest < ActionDispatch::IntegrationTest
  test "should get cool" do
    get gif_cool_url
    assert_response :success
  end

  test "should get free" do
    get gif_free_url
    assert_response :success
  end

end
