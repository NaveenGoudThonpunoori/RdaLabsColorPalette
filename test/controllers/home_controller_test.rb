require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert session[:user].nil?
    assert_response :success
  end

  test "should get leaderboard" do
    get leader_board_home_index_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post home_index_url, params: { user_name: 'Ganguly' }
    end
    assert session[:user].present?
    assert_redirected_to grids_url
  end

  test "should not create user" do
    assert_difference('User.count', 0) do
      post home_index_url, params: { user_name: 'naveen' }
    end
    assert session[:user].present?
    assert_redirected_to grids_url
  end
end
