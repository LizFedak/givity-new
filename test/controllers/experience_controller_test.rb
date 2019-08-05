require 'test_helper'

class ExperienceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experience_index_url
    assert_response :success
  end

  test "should get new" do
    get experience_new_url
    assert_response :success
  end

  test "should get create" do
    get experience_create_url
    assert_response :success
  end

  test "should get listing" do
    get experience_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get experience_pricing_url
    assert_response :success
  end

  test "should get description" do
    get experience_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get experience_photo_upload_url
    assert_response :success
  end

  test "should get location" do
    get experience_location_url
    assert_response :success
  end

  test "should get update" do
    get experience_update_url
    assert_response :success
  end

end
