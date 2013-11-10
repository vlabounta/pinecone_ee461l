class AddUserIdToNewHires < ActiveRecord::Migration
  def change
    add_column :new_hires, :user_id, :integer
  end
end
