class CreateContextClients < ActiveRecord::Migration
  def change
    create_table :context_clients do |t|

      t.timestamps
    end
  end
end
