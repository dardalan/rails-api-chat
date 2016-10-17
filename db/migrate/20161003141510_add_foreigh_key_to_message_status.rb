class AddForeighKeyToMessageStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :message_statuses, :user_id, :integer
    add_index :message_statuses, :user_id
  end
end
