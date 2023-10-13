class AddIsMasterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_master, :boolean
  end
end
