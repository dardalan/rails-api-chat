class Api::Chatrooms::SearchInteraction < CustomInteractionBase
  integer :id
  object :user
  string :query

  def execute
    Chatroom.find(id).messages.where("body LIKE ?" , "%#{query}%")
  end
end
