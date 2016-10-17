class Api::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.find_by!(email: session_params[:email].try(:downcase))
    hash = {email: user.email, token: user.authentication_token, id: user.id }

    if user && user.authenticate(session_params[:password])
      render json: hash, status: 200
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
