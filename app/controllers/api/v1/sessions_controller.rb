class Api::V1::SessionsController < ApplicationController
  def create
    user = User
      .find_by(email: session_params[:email])
      .try(:authenticate, session_params[:password])

    if user
      hmac_secret = Rails.application.credentials[:jwt_auth_token_key]
      payload = { id: user.id, name: user.name, email: user.email }
      token = JWT.encode(payload, hmac_secret, 'HS256')
      render json: { status: :ok, message: 'Authenticated', data: token }
    else
      render json: { status: :not_found, message: 'Invalid email or password' }
    end
  end

  private

  def session_params
    params.require(:session).permit(:password, :email)
  end
end
