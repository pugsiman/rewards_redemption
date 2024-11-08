require 'rails_helper'

RSpec.describe 'Api::Rewards', type: :request do
  describe 'GET /index' do
    let!(:rewards) { create_list(:reward, 3) }
    let!(:unavailable_reward) { create(:reward, available: false) }

    it 'returns available rewards' do
      get '/api/rewards'
      expect(response).to have_http_status(:success)

      data = JSON.parse(response.body)
      expect(data.size).to eq rewards.size
    end
  end
end
