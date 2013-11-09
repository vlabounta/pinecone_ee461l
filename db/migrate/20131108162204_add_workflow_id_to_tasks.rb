class AddWorkflowIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :workflow_id, :integer
  end
end
