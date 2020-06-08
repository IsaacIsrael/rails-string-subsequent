require 'spec_helper'

RSpec.describe DestroyCalculationHistoty, type: :interactor do
  describe '.call' do
    let(:user) { FactoryBot.create(:user) }
    context 'passing valid id' do
      let(:calculation) { FactoryBot.create(:calculation, user: user) }
      let(:context) { DestroyCalculationHistoty.call(id: calculation.id, user: user) }
      it('should be valid') { expect(context.success?).to be_truthy }
      it('should change #count by -1') do
        calculation = FactoryBot.create(:calculation, user: user)
        expect { DestroyCalculationHistoty.call(id: calculation.id, user: user) }
                .to change(Calculation.all, :count)
                .by(-1)
      end
    end
    context 'passing invalid id' do
      let(:context) { DestroyCalculationHistoty.call(user: user) }
      it('should be invalid') { expect(context.success?).to be_falsey }
      it('error should be Not find calculation record') { expect(context.error).to eq("Not find calculation record") }
      it { expect { DestroyCalculationHistoty.call(user: user) }
                  .to change(Calculation.all, :count)
                  .by(0)
          }
    end
    context 'passing valid id from other user' do
      let(:other) { FactoryBot.create(:user) }
      let(:calculation) { FactoryBot.create(:calculation, user: other) }
      let(:context) { DestroyCalculationHistoty.call(id: calculation.id, user: user) }
      it('should be invalid') { expect(context.success?).to be_falsey }
      it('error should be Not find calculation record') { expect(context.error).to eq("Not find calculation record") }
      it 'should change #count by 0'do
        calculation = FactoryBot.create(:calculation, user: other)
        expect { DestroyCalculationHistoty.call(id: calculation.id, user: user) }
                  .to change(Calculation.all, :count)
                  .by(0)
      end
    end
  end
end
