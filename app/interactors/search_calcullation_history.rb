class SearchCalcullationHistory
  include Interactor

  def call
    context.response = context.user.calculations.order(id: :desc)
  end
end
