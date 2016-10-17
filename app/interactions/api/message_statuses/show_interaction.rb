class Api::MessageStatuses::ShowInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    message_status = MessageStatus.find(id)
  end
end
