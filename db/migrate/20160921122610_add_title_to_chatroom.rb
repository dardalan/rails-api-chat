class AddTitleToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :title, :string
  end
end
