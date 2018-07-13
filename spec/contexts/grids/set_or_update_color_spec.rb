require 'rails_helper'

RSpec.describe Grids::SetOrUpdateColor do
  let(:params) {
    {
        color: '#000000',
        position: 22,
        user_id: 4
    }
  }

  subject { Grids::SetOrUpdateColor.new(params) }

  describe '#call' do
    it 'should call the required methods' do
      expect(subject).to receive(:assign_columns)
      expect(subject).to receive(:save!)
      subject.call
    end
  end

  describe '#save!' do
    it 'should call the required methods' do
      expect(subject.grid).to receive(:save!)
      subject.save!
    end
  end

  describe '#assign_columns' do
    it 'should assign reuired columns' do
      expect(subject.grid).to receive(:user_id=).with(params[:user_id])
      expect(subject.grid).to receive(:position=).with(params[:position])
      expect(subject.grid).to receive(:color=).with(params[:color])
      subject.assign_columns
    end
  end
end
