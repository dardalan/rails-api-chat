class Api::ChatroomsController < ApplicationController
  def index
    render_response(Api::Chatrooms::IndexInteraction, index_params, { meta: 'base' })
  end

  def create
    render_response(Api::Chatrooms::CreateInteraction, create_interaction_hash, { serializer: ChatroomSerializer })
  end

  def show
    render_response(Api::Chatrooms::ShowInteraction, interaction_show_hash, { serializer: ChatroomSerializer })
  end

  def search
    render_response(Api::Chatrooms::SearchInteraction, interaction_search_hash, { each_serializer: MessageSerializer })
  end

  private

  def index_params
    params.permit(:page, :per_page).merge(user: current_user)
  end

  def interaction_search_hash
    hash = { user: @current_user, id: params[:chatroom_id], query: params[:query] }
  end

  def interaction_show_hash
    hash = { user: @current_user, id: params[:id] }
  end

  def create_interaction_hash
    jsonapi_parse(params, only: %w(title members)).merge(user: current_user)
  end
end
