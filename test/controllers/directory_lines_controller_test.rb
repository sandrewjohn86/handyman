require 'test_helper'

class DirectoryLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get directory_lines_new_url
    assert_response :success
  end

  test "should get create" do
    get directory_lines_create_url
    assert_response :success
  end

  test "should get update" do
    get directory_lines_update_url
    assert_response :success
  end

  test "should get edit" do
    get directory_lines_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get directory_lines_destroy_url
    assert_response :success
  end

  test "should get index" do
    get directory_lines_index_url
    assert_response :success
  end

  test "should get show" do
    get directory_lines_show_url
    assert_response :success
  end

end
