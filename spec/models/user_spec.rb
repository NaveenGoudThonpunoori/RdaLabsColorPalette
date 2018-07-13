require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  describe 'validations' do
    it 'is not valid without name' do
      is_expected.not_to be_valid
    end

    it 'is not valid with duplicate name' do
      subject.name = 'naveen'
      is_expected.not_to be_valid
    end

    it 'is valid with unique name' do
      subject.name = 'Naveen Geek'
      is_expected.to be_valid
    end
  end

  it 'has the correct associations' do
    expect(subject).to respond_to(:grids)
  end
end
