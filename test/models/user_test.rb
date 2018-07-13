require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    assert users(:one).valid?
  end

  test 'should not save user without name' do
    user = User.new
    assert_not user.save
  end

  test 'should save use with uniq names' do
    user = User.new(name: 'naveen_test')
    assert user.save
  end

  test 'should not save use with duplicate names' do
    user = User.new(name: 'naveen')
    assert_not user.save
  end

  test 'should delete user' do
    assert users(:one).delete
  end

  test 'testing association with grid' do
    user = users(:one)
    assert_respond_to user, :grids
  end

  test 'grid records should be deleted when user deleted' do
    user = users(:one)
    grid = user.grids.create(color: '#fffff', position: 1)
    user.destroy
    assert_raises (ActiveRecord::RecordNotFound) {
      grid.reload
    }
  end
end
