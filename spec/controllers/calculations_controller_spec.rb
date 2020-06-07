require 'rails_helper'

RSpec.describe CalculationsController, type: :controller do
  describe '#index' do
    context 'as a user' do
      let(:user) { FactoryBot.create(:user) }
      before do

        other_user = FactoryBot.create(:user)
        FactoryBot.create_list(:calculation, 10, user: user)
        FactoryBot.create_list(:calculation, 5, user: other_user)

        sign_in user
        get :index
      end
      it { expect(response).to be_successful }
      it { expect(response).to have_http_status :ok }
      it('response should have only user calculations') { expect(response.body).to eq(user.calculations.order(id: :desc).to_json) }
    end
    context 'as a visitor' do
      before { get :index }
      it { expect(response).to_not be_successful }
      it { expect(response).to have_http_status :unauthorized }
    end
  end
end
