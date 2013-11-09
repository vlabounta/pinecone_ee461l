class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :author_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end