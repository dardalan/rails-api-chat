class Api::Chatrooms::IndexInteraction < CustomInteractionBase
  integer :per_page, default: 10
  integer :page, default: 1
  object :user

  def execute
    User.find(user.id).chatrooms.page(page).per(per_page)
  end
end
