class Api::Messages::CreateInteraction < CustomInteractionBase
  object   :user
  string   :body, default: nil
  integer  :chatroom_id
  integer  :attachment_id, default: nil

  def execute
    options = { initiator_id: user.id }
    participants = Chatroom.find(chatroom_id).users

    if attachment_id.present?
      message = create_message_attachment
    else
      message = Message.create(body: body, chatroom_id: chatroom_id, user: user)
    end

    participants.each do |participant|
      default_status = participant == user ? 'delivered' : 'unread'
      MessageStatus.create(message: message, status: default_status, user: participant)
    end

    ActionCable.server.broadcast("chat_#{chatroom_id}", options.merge!({message_id: message.id}))
    message
  end

  def create_message_attachment
    message = Message.create(chatroom_id: chatroom_id, user: user)
    Attachment.find(attachment_id).update(message: message)

    message
  end
end
