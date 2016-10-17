class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :messages

  has_many :chatroom_participants
  has_many :users, through: :chatroom_participants
end
