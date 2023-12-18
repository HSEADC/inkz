class CreateTattoos < ActiveRecord::Migration[7.0]
  def change
    create_table :tattoos do |t|
      t.string :title
      t.string :specialization
      t.references :master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
