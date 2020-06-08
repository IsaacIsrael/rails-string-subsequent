class CalculationsController < ApplicationController
  def index
    @result = SearchCalcullationHistory.call(user: current_user)
    render json: @result.response.to_json
  end

  def create
    @result = FindSubsequence.call(
        string_a: params[:string_a],
        string_b: params[:string_b],
        user: current_user
      )
    if @result.success?
      render json: @result.response.to_json, status: :created
    else
      render json: { error: @result.error }, status: :bad_request
    end
  end

  def destroy
    @result = DestroyCalculationHistoty.call(id: params[:id], user: current_user )

    if @result.success?
      render status: :ok
    else
      render json: { error: @result.error }, status: :bad_request
    end
  end

  private

  def calculation_params
    params.permit(:string_a, :string_b)
  end
end
