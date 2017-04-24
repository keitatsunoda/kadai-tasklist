class RenameUserColumnToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks , :user, :user_id
  end
end
