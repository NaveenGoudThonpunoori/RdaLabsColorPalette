require 'rails_helper'

RSpec.describe GridsController, type: :controller do
  let(:params) {
    {
        color: '#000000',
        position: 22
    }
  }
  before do
    session[:user] = User.last.as_json
  end

  describe 'GET index' do
    it "renders the index template" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end
  end

  describe 'POST set_or_update_color' do
    it 'should call Grids::SetOrUpdateColor call method' do
      expect(Grids::SetOrUpdateColor).to receive(:call)
      post :set_or_update_color, params: params
      expect(response).to be_success
      expect(JSON.parse(response.body)).to eq({"msg"=>"success"})
    end
  end
end
