require 'rails_helper'

RSpec.describe 'Api::Redemptions', type: :request do
  describe 'GET api/users/:user_id/redemptions' do
    let(:user) { create(:user) }
    let!(:redemptions) { create_list(:redemption, 3, user: user) }

    it 'returns the redemptions of a user' do
      get api_user_redemptions_path(user_id: user.id), headers: { 'Content-Type' => 'application/json' }
      expect(response).to have_http_status(:success)

      data = JSON.parse(response.body)
      expect(data.map { |r| r['id'] }).to match user.redemptions.map(&:id)
    end
  end

  describe 'POST api/users/:user_id/redemptions' do
    context 'with sufficient credits' do
      let(:user) { create(:user, credits_amount: 500) }
      let(:desired_reward) { create(:reward, cost: 400, available: true) }

      it 'creates a redemption for user' do
        expect do
          post api_user_redemptions_path(user_id: user.id, reward_id: desired_reward.id),
               headers: { 'Content-Type' => 'application/json' }
        end.to change(user.redemptions, :count).by(1)
      end

      it 'reduces the user credits by the amount spent' do
        post api_user_redemptions_path(user_id: user.id, reward_id: desired_reward.id),
             headers: { 'Content-Type' => 'application/json' }
        amount_left = user.credits_amount - desired_reward.cost
        expect(user.reload.credits_amount).to eq amount_left
      end
    end

    context 'without sufficient credits' do
      let(:user) { create(:user, credits_amount: 100) }
      let(:desired_reward) { create(:reward, cost: 400, available: true) }

      it 'returns an error' do
        post api_user_redemptions_path(user_id: user.id, reward_id: desired_reward.id),
             headers: { 'Content-Type' => 'application/json' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with unavailable reward' do
      let(:user) { create(:user, credits_amount: 500) }
      let(:desired_reward) { create(:reward, cost: 400, available: false) }
      it 'returns an error' do
        post api_user_redemptions_path(user_id: user.id, reward_id: desired_reward.id),
             headers: { 'Content-Type' => 'application/json' }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
