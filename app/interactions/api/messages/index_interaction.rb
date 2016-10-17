class Api::Messages::IndexInteraction < CustomInteractionBase
  integer :per_page, default: 10
  integer :page, default: 1
  integer :chatroom_id
  object :user

  def execute
    Chatroom.find(chatroom_id).messages.page(page).per(per_page).order('id desc')
  end
end
