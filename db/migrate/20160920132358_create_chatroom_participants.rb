class CreateChatroomParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :chatroom_participants do |t|
      t.string :role
      t.integer :user_id
      t.integer :chatroom_id
      t.timestamps
    end
  end
end
