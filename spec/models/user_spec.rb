require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory Bot' do
    it 'creates user succesfully' do
      create(:user)
    end
  end
end
