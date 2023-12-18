class AddUserIdToMaster < ActiveRecord::Migration[7.0]
  def change
    add_column :masters, :user_id, :integer
  end
end
