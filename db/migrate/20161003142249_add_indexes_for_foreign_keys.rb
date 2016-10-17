class AddIndexesForForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_index :chatroom_participants, :user_id
    add_index :chatroom_participants, :chatroom_id
    add_index :chatrooms, :user_id
    add_index :message_statuses, :message_id
    add_index :messages, :chatroom_id
    add_index :messages, :user_id
  end
end
