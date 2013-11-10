class CreateNewHires < ActiveRecord::Migration
  def change
    create_table :new_hires do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
