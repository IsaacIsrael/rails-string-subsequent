class CalculationsController < ApplicationController
  def index
    @result = SearchCalcullationHistory.call(user: current_user)
    render json: @result.response.to_json
  end
end
