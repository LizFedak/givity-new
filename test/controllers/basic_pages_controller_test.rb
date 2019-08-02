require 'test_helper'

class BasicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get basic_pages_about_url
    assert_response :success
  end

  test "should get blog" do
    get basic_pages_blog_url
    assert_response :success
  end

  test "should get explore" do
    get basic_pages_explore_url
    assert_response :success
  end

  test "should get faq" do
    get basic_pages_faq_url
    assert_response :success
  end

  test "should get help" do
    get basic_pages_help_url
    assert_response :success
  end

  test "should get home" do
    get basic_pages_home_url
    assert_response :success
  end

  test "should get privacy" do
    get basic_pages_privacy_url
    assert_response :success
  end

  test "should get team" do
    get basic_pages_team_url
    assert_response :success
  end

  test "should get terms" do
    get basic_pages_terms_url
    assert_response :success
  end

end
