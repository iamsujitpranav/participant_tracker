require "test_helper"

class CoordinatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coordinators_new_url
    assert_response :success
  end

  test "should get create" do
    get coordinators_create_url
    assert_response :success
  end

  test "should get edit" do
    get coordinators_edit_url
    assert_response :success
  end

  test "should get update" do
    get coordinators_update_url
    assert_response :success
  end

  test "should get index" do
    get coordinators_index_url
    assert_response :success
  end
end
