class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id
      t.text :content
      t.string :from
      t.text :to
      t.integer :task_id

      t.timestamps
    end
  end
end
