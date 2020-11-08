require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscribers_index_url
    assert_response :success
  end

  test "should get new" do
    get subscribers_new_url
    assert_response :success
  end

  test "should get create" do
    get subscribers_create_url
    assert_response :success
  end

  test "should get verify" do
    get subscribers_verify_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get subscribers_unsubscribe_url
    assert_response :success
  end

end
