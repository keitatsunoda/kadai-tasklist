class AddUserToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :user , :integer
  end
end
