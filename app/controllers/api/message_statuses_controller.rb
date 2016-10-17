class Api::MessageStatusesController < ApplicationController
  def show
    render_response(Api::MessageStatuses::ShowInteraction, interaction_show_hash, { serializer: MessageStatusSerializer })
  end

  def messages_status
    render_response(Api::MessageStatuses::UpdateMessagesStatusInteraction, interaction_show_hash, { each_serializer: MessageSerializer })
  end

  private

  def interaction_show_hash
    hash = { user: @current_user, id: params[:id] }
  end
end
