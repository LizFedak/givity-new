require 'test_helper'

class VolunteerProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get skills" do
    get volunteer_profiles_skills_url
    assert_response :success
  end

  test "should get update" do
    get volunteer_profiles_update_url
    assert_response :success
  end

  test "should get show" do
    get volunteer_profiles_show_url
    assert_response :success
  end

  test "should get index" do
    get volunteer_profiles_index_url
    assert_response :success
  end

  test "should get _form" do
    get volunteer_profiles__form_url
    assert_response :success
  end

  test "should get edit" do
    get volunteer_profiles_edit_url
    assert_response :success
  end

end
