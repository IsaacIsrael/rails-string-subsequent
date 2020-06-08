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

  describe '#create' do
    context 'as a user' do
      before { sign_in FactoryBot.create(:user) }
      context 'passing valid parameters' do
        let(:calculation_params) { FactoryBot.attributes_for(:calculation) }
        before { post :create, params: calculation_params }
        it { expect(response).to be_successful }
        it { expect(response).to have_http_status :created }
        it { expect { post :create, params: calculation_params }
                    .to change(Calculation.all, :count)
                    .by(1)
            }
      end

      context 'passing nil parameters' do
        let(:calculation_params) { { string_a: nil, string_b: nil } }
        before { post :create, params: calculation_params }
        it { expect(response).to be_successful }
        it { expect(response).to have_http_status :created }
        it { expect { post :create, params: calculation_params }
                    .to change(Calculation.all, :count)
                    .by(1)
            }
      end
    end
    context 'as a visitor' do
      let(:calculation_params) { { string_a: nil, string_b: nil } }
      before { post :create, params: calculation_params }
      it { expect(response).to_not be_successful }
      it { expect(response).to have_http_status :unauthorized }
      it { expect { post :create, params: calculation_params }
                    .to change(Calculation.all, :count)
                    .by(0)
            }
    end
  end
end
