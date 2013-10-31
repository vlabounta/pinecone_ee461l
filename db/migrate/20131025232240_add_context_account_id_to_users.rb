class AddContextAccountIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :context_account_id, :string
  end
end
