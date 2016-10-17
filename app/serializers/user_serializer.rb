class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :avatar

  has_many :chatrooms

  def avatar
    current_user.avatar
  end
end
