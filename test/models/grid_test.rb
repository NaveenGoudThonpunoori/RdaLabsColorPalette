require 'test_helper'

class GridTest < ActiveSupport::TestCase
  test 'should be valid when color, position and user_id are present' do
    grid = Grid.new
    grid.color = "#ffffff"
    grid.user_id = users(:one).id
    grid.position = 1
    assert grid.valid?
  end

  test 'should not save grid without color, position and user' do
    grid = Grid.new
    assert_not grid.save
  end

  test 'testing association with user' do
    grid = grids(:one)
    assert_respond_to grid, :user
  end

  test 'should delete grid' do
    assert grids(:one).delete
  end
end
