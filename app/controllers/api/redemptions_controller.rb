class Api::RedemptionsController < ApplicationController
  def index
    render json: user.redemptions, status: :ok
  end

  def create
    if reward.available && user.credits_amount >= reward.cost
      ActiveRecord::Base.transaction do
        user.update!(credits_amount: user.credits_amount - reward.cost)
        redemption = user.redemptions.create!(reward: reward, paid_amount: reward.cost)

        render json: redemption, status: :created
      end
    else
      render json: { error: 'User cannot redeem reward' }, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def reward
    @reward ||= Reward.find(params[:reward_id])
  end
end
