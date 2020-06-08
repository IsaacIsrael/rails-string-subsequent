require 'rails_helper'

RSpec.describe AddCalculationHistory, type: :interactor do
  describe '.call' do
    let(:user) { FactoryBot.create(:user) }
    context 'passing valid parameters result true' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: 'baabd', result: true, substrings: [1, 3, 7, 8, 9], user: user} }
      let(:context) { AddCalculationHistory.(params) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { AddCalculationHistory.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    context 'passing valid parameters result false' do
      let(:params) { { string_a: 'abcdefg', string_b: 'fb', result: false, user: user } }
      let(:context) { AddCalculationHistory.(params) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { AddCalculationHistory.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    context 'passing empty strings and substrings' do
      let(:params) { { string_a: '', string_b: '', result: true, substrings: [], user: user } }
      let(:context) { AddCalculationHistory.(params) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { AddCalculationHistory.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    # context 'passing other type (not string) as  strings and substrings' do
    #   let(:params) { { string_a: 1, string_b: 2, result: true, substrings: [], user: user } }
    #   let(:context) { AddCalculationHistory.(params) }
    #   it('should be invalidy') { expect(context.success?).to be_falsey }
    #   it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    # end

    # context 'passing nil strings and substrings' do
    #   let(:params) { { string_a: nil, string_b: nil, result: true, substrings: [], user: user } }
    #   let(:context) { AddCalculationHistory.(params) }
    #   it('should be invalidy') { expect(context.success?).to be_falsey }
    #   it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    # end
  end
end
