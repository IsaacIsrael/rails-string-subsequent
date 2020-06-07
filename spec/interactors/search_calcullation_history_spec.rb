require 'rails_helper'

RSpec.describe SearchCalcullationHistory, type: :interactor do
  describe '.call' do
    let(:user1) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }
    before do
      FactoryBot.create_list(:calculation, 10, user: user1)
      FactoryBot.create_list(:calculation, 5, user: user2)
    end
    subject(:context) { SearchCalcullationHistory.call(user: user1) }
    it('should response count eq 10') { expect(context.response.count).to eq 10 }
    it('should contain exactly all user 1 calculation') { expect(context.response).to match_array(user1.calculations) }
    it('should not contain exactly all user 2 calculation') { expect(context.response).to_not match_array(user2.calculations) }
  end
end
