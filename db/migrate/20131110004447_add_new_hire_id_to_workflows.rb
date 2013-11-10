class AddNewHireIdToWorkflows < ActiveRecord::Migration
  def change
    add_column :workflows, :new_hire_id, :integer
  end
end
