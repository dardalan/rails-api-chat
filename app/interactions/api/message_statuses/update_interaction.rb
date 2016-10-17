class Api::MessageStatuses::UpdateInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    #do magic here
  end
end
