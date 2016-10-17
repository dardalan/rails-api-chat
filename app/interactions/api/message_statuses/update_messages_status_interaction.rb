class Api::MessageStatuses::UpdateMessagesStatusInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    message_ids = Chatroom.find(id).messages.pluck(:id)

    messages = MessageStatus.where(message_id: message_ids, user: user, status: 'unread')
    messages.update_all(status: 'read')
    messages
  end
end
