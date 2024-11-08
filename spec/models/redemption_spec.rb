require 'rails_helper'

RSpec.describe Redemption, type: :model do
  describe 'Factory bot' do
    it 'created a record succesfully' do
      create(:redemption)
    end
  end
end
