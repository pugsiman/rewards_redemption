require 'rails_helper'

RSpec.describe 'Api::Users', type: :request do
  describe 'GET /show' do
    let(:user) { create(:user) }

    it 'returns http success' do
      get "/api/users/#{user.id}"
      expect(response).to have_http_status(:success)
      data = JSON.parse(response.body)
      expect(data['credits_amount']).to eq user.credits_amount
    end
  end
end
