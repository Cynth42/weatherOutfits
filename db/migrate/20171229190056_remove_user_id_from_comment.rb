class RemoveUserIdFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :user_id, :integer, null: false, default: '', index: true
  end
end
