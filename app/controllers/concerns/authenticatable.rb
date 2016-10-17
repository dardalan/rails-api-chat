require 'active_support/concern'

module Authenticatable
  extend ActiveSupport::Concern
  include ErrorSerializer

  protected

  def current_user
    @current_user ||= User.find_by(authentication_token: get_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate_user!
    deny_access unless signed_in?
  end

  def deny_access
    render json: { errors: [{ status: 401, title: "Not authorized!" }] }, status: 401
  end

  def not_found
    render json: { errors: [{ status: 404, title: "Not found" }] }, status: 404
  end

  private

  def get_token
    request.headers["Authorization"].split("\"").second if request.headers["Authorization"].present?
  end
end
