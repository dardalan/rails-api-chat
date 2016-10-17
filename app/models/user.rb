class User < ApplicationRecord
  before_save :ensure_authentication_token

  has_many :chatroom_participants
  has_many :chatrooms, through: :chatroom_participants
  validates :email, presence: true, uniqueness: true

  mount_uploader :avatar, ImageUploader
  has_secure_password
  
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
