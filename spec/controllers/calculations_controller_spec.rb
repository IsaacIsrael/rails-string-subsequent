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

  describe '#destroy' do
    context 'as a user' do
      let(:user) { FactoryBot.create(:user) }
      before { sign_in user }
      context 'passing valid id' do
        let(:calculation) { FactoryBot.create(:calculation, user: user) }
        before { delete :destroy, params: { id: calculation.id } }
        it { expect(response).to be_successful }
        it { expect(response).to have_http_status :ok }
        it('should change #count by -1') do
          calculation = FactoryBot.create(:calculation, user: user)
          expect { delete :destroy, params: { id: calculation.id } }
                  .to change(Calculation.all, :count)
                  .by(-1)
        end
      end

      context 'passing invalid id' do
        before { delete :destroy, params: { id: 99 } }
        it { expect(response).to_not be_successful }
        it { expect(response).to have_http_status :bad_request }
        it { expect { delete :destroy, params: { id: 99 } }
                    .to change(Calculation.all, :count)
                    .by(0)
            }
      end

      context 'passing valid id from other user' do
        let(:other) { FactoryBot.create(:user) }
        let(:calculation) { FactoryBot.create(:calculation, user: other) }
        before { delete :destroy, params: { id: calculation.id } }
        it { expect(response).to_not be_successful }
        it { expect(response).to have_http_status :bad_request }
        it('should change #count by  0') do
          calculation = FactoryBot.create(:calculation, user: other)
          expect { delete :destroy, params: { id: calculation.id } }
                  .to change(Calculation.all, :count)
                  .by(0)
        end
      end
    end

    context 'as a visitor' do
      let(:calculation) { FactoryBot.create(:calculation) }
      before { delete :destroy, params: { id: calculation.id } }
      it { expect(response).to_not be_successful }
      it { expect(response).to have_http_status :unauthorized }
      it { expect { delete :destroy, params: { id: calculation.id } }
                    .to change(Calculation.all, :count)
                    .by(0)
            }
    end
  end
end
