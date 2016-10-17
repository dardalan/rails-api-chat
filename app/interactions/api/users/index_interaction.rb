class Api::Users::IndexInteraction < CustomInteractionBase
  object :user

  def execute
    users = User.where.not(id: user.id)
  end
end
