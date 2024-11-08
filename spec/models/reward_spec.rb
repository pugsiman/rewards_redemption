require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'Factory Bot' do
    it 'succesfully creates record' do
      create(:reward)
    end
  end
end
