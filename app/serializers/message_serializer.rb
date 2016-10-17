class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at, :status, :attachment

  belongs_to :user

  def status
    MessageStatus.where(user: current_user, message: object).first.status
  end

  def attachment
    attachment = Attachment.where(message: object).first
    attachment.name if attachment.present?
  end
end
