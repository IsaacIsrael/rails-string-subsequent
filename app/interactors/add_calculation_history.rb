class AddCalculationHistory
  include Interactor

  def call
    calculation = Calculation.new(
                        string_a: context.string_a,
                        string_b: context.string_b,
                        result: context.result,
                        substrings: context.substrings,
                        user: context.user
                      )
    if calculation.valid?
      calculation.save
      context.response = calculation
    else
      context.error = calculation.errors.messages
      context.fail!
    end
  end
end
