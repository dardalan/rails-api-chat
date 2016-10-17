class ChatroomSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :user
  has_many :messages
end
