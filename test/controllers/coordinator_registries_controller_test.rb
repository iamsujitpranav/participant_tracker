require "test_helper"

class CoordinatorRegistriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get coordinator_registries_new_url
    assert_response :success
  end

  test "should get create" do
    get coordinator_registries_create_url
    assert_response :success
  end

  test "should get index" do
    get coordinator_registries_index_url
    assert_response :success
  end

  test "should get edit" do
    get coordinator_registries_edit_url
    assert_response :success
  end

  test "should get update" do
    get coordinator_registries_update_url
    assert_response :success
  end
end
