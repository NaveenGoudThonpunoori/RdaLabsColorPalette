require 'test_helper'

class GridsControllerTest < ActionDispatch::IntegrationTest

  def setup
    post home_index_url, params: { user_name: 'naveen' }
  end

  test "should get index" do
    get grids_url
    assert_response 200
  end

  test "should create grid" do
    assert_difference('Grid.count', 1) do
      post set_or_update_color_grids_url, params: { position: 12, color: "#000000" }
    end
    assert_response 200
  end

  test "should not create grid when we call on the existing grid" do
    post set_or_update_color_grids_url, params: { position: 2, color: "#000000" }
    assert_difference('Grid.count', 0) do
      post set_or_update_color_grids_url, params: { position: 2, color: "#000000" }
    end
    assert_response 200
  end

  test "should raise 500" do
    post set_or_update_color_grids_url, params: { color: "#000000" }
    assert_response 500
  end
end
