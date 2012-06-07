class AddTaskDescription < ActiveRecord::Migration
  def change
    add_column :sites, :task_description, :string
  end

  def up
  end

  def down
  end
end
