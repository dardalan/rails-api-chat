class Api::Users::ShowInteraction < CustomInteractionBase
  integer :id
  object :user

  def execute
    User.find(id)
  end
end
