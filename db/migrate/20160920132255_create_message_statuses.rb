class CreateMessageStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :message_statuses do |t|
      t.integer :message_id
      t.string :status
      t.timestamps
    end
  end
end
