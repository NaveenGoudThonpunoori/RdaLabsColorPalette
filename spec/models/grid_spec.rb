require 'rails_helper'

RSpec.describe Grid, type: :model do
  subject { Grid.new }

  describe 'validations' do
    it 'is not valid without user_id, color and position' do
      is_expected.not_to be_valid
    end

    it 'is valid with user, color and position' do
      subject.color = '#000000'
      subject.position = 22
      subject.user_id = User.last.id
      is_expected.to be_valid
    end
  end

  it 'has the correct associations' do
    expect(subject).to respond_to(:user)
  end
end
