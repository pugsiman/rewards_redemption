class Api::RewardsController < ApplicationController
  def index
    rewards = Reward.available
    render json: rewards, status: :ok
  end
end
