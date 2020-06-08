require 'spec_helper'

RSpec.describe FindSubsequence, type: :interactor do
  describe '.call' do
    let(:user) { FactoryBot.create(:user) }
    describe 'passing a substrings ' do
      let(:params) { { string_a: 'abcdefg', string_b: 'beg', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly [1, 4, 6]') { expect(context.substrings).to match_array([1, 4, 6]) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    describe 'passing a substrings with repeted characters ' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: 'baabd', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly [1, 3, 7, 8, 9]') { expect(context.substrings).to match_array([1, 3, 7, 8, 9]) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

     describe 'passing a empty substrings' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: '', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly []') { expect(context.substrings).to match_array([]) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    describe 'passing a empty substrings and string ' do
      let(:params) { { string_a: '', string_b: '', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly []') { expect(context.substrings).to match_array([]) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    describe 'passing a not substrings with inverted characters' do
      let(:params) { { string_a: 'abcdefg', string_b: 'fb', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    describe 'passing a not substrings with repeted characters ' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: 'baabbd', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    describe 'passing a substrings longer than the string' do
      let(:params) { { string_a: 'fb', string_b: 'abcdefg', user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
      it('response should be a kind of Calculation'){ expect(context.response).to be_a(Calculation) }
      it('response id should not be nil') { expect(context.response.id).to_not be_nil }
      it { expect { FindSubsequence.(params) }
                  .to change(Calculation.all, :count)
                  .by(1)
          }
    end

    context 'passing other type (not string) as  strings and substrings' do
      let(:params) { { string_a: 1, string_b: 2, user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should be invalidy') { expect(context.success?).to be_falsey }
      it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    end

    context 'passing nil strings and substrings' do
      let(:params) { { string_a: nil, string_b: nil, user: user } }
      let(:context) { FindSubsequence.(params) }
      it('should be invalidy') { expect(context.success?).to be_falsey }
      it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    end
  end
end
