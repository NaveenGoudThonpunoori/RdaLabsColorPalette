require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'Post create' do
    it "redirect to grids path" do
      post :create
      expect(:user).to be
      expect(session[:user]).to be
      expect(response).to redirect_to(grids_url)
    end
  end

  describe 'GET index' do
    it "renders the index template" do
      get :index
      expect(session[:user]).to be_nil
      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

  describe 'GET leader_board' do
    it 'renders the leader_board template' do
      get :leader_board
      expect(response).to be_success
      expect(response).to render_template('leader_board')
    end
  end
end
