class MessageStatusSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at

  belongs_to :message
end
