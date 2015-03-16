class AddDoneToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :done, :boolean, default: false
  end
end
