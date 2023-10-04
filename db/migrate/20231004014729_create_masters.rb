class CreateMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :masters do |t|
      t.string :name
      t.string :nickname
      t.string :specialization

      t.timestamps
    end
  end
end
