class Api::MessagesController < ApplicationController
  def index
    render_response(Api::Messages::IndexInteraction, index_params, { each_serializer: MessageSerializer, meta: 'base', include: :user})
  end

  def create
    render_response(Api::Messages::CreateInteraction, create_interaction_hash, { serializer: MessageSerializer })
  end

  def show
    render_response(Api::Messages::ShowInteraction, interaction_show_hash, { serializer: MessageSerializer, include: :message_status })
  end

  private

  def index_params
    params.permit(:page, :per_page, :chatroom_id).merge(user: current_user)
  end

  def interaction_show_hash
    hash = { user: @current_user, id: params[:id] }
  end

  def create_interaction_hash
    jsonapi_parse(params, only: %w(body chatroom attachment-id)).merge(user: current_user)
  end
end
