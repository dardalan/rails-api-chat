class Api::UsersController < ApplicationController
  def index
    render_response(Api::Users::IndexInteraction, { user: @current_user }, { each_serializer: UserSerializer })
  end

  def show
    render_response(Api::Users::ShowInteraction, interaction_show_hash, { serializer: UserSerializer, include: :chatrooms })
  end

  private

  def interaction_show_hash
    hash = { user: @current_user, id: params[:id] }
  end
end
