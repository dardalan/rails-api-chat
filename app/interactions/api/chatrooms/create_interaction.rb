class Api::Chatrooms::CreateInteraction < CustomInteractionBase
  object :user
  string :title
  array  :member_ids, default: []

  def execute
    chatroom = Chatroom.create(title: title, user: user)
    member_ids << user.id

    member_ids.each do |id|
      ChatroomParticipant.create(user_id: id, chatroom: chatroom)
    end
    chatroom
  end
end
