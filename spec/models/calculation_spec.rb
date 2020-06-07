require 'rails_helper'

RSpec.describe Calculation, type: :model do
  let(:calculation) { FactoryBot.build(:calculation) }

  it { should have_db_column(:string_a).of_type(:string) }
  it { should have_db_column(:string_b).of_type(:string) }
  it { should have_db_column(:result).of_type(:boolean) }
  it { should have_db_column(:substrings).of_type(:integer). with_options(default: [], array: true) }
  it('should have a field substrings an instance of Array') do
    expect(calculation.substrings).to be_an_instance_of(Array)
  end
  it { should belong_to(:user) }

  describe 'factory bot' do
    it { expect(calculation).to be_valid }
  end
end
