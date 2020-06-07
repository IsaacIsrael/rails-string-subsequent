# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save

    if resource.errors.empty?
      render json: resource
    else
      render json: { errors: resource.errors }, status: :bad_request
    end
  end
end
