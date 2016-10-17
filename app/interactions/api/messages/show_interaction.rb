class Api::Messages::ShowInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    Message.find(id)
  end
end
