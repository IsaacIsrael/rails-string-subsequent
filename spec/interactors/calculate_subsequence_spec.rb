require 'rails_helper'

RSpec.describe CalculateSubsequence, type: :interactor do
  describe '.call' do
    describe 'passing a valid substrings ' do
      let(:params) { { string_a: 'abcdefg', string_b: 'beg' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly [1, 4, 6]') { expect(context.substrings).to match_array([1, 4, 6]) }
    end

    describe 'passing a valid substrings with repeted characters ' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: 'baabd' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly [1, 3, 7, 8, 9]') { expect(context.substrings).to match_array([1, 3, 7, 8, 9]) }
    end

     describe 'passing a empty substrings' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: '' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly []') { expect(context.substrings).to match_array([]) }
    end

    describe 'passing a empty substrings and string ' do
      let(:params) { { string_a: '', string_b: '' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq true') { expect(context.result).to eq(true) }
      it('should substrings contain exactly []') { expect(context.substrings).to match_array([]) }
    end

    describe 'passing a invalid substrings with inverted characters' do
      let(:params) { { string_a: 'abcdefg', string_b: 'fb' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
    end

    describe 'passing a invalid substrings with repeted characters ' do
      let(:params) { { string_a: 'abcadebabdeb', string_b: 'baabbd' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
    end

    describe 'passing a substrings longer than the string' do
      let(:params) { { string_a: 'fb', string_b: 'abcdefg' } }
      let(:context) { CalculateSubsequence.(params) }
      it('should result eq false') { expect(context.result).to eq(false) }
    end

    context 'passing other type (not string) as  strings and substrings' do
      let(:params) { { string_a: 1, string_b: 2 } }
      let(:context) { CalculateSubsequence.(params) }
      it('should be invalidy') { expect(context.success?).to be_falsey }
      it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    end

    context 'passing nil strings and substrings' do
      let(:params) { { string_a: nil, string_b: nil } }
      let(:context) { CalculateSubsequence.(params) }
      it('should be invalidy') { expect(context.success?).to be_falsey }
      it('errror should be the values are not a string') { expect(context.error).to eq('The values are not strings') }
    end
  end
end
