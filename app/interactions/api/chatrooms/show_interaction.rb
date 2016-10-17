class Api::Chatrooms::ShowInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    Chatroom.find(id)
  end
end
