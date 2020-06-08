class DestroyCalculationHistoty
  include Interactor

  def call
    calculation = Calculation.find_by(id: context.id, user_id: context.user.id)
    if calculation
      calculation.destroy
    else
      context.error = 'Not find calculation record'
      context.fail!
    end
  end
end
