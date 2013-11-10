class AddTagsToWorkflows < ActiveRecord::Migration
  def change
    add_column :workflows, :tags, :string
  end
end
