class Api::AttachmentsController < ApplicationController
  def create
    render_response(Api::Attachments::CreateInteraction, create_interaction_hash)
  end

  private

  def create_interaction_hash
    hash = { user: @current_user, file: params[:file] }
  end
end
