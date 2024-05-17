class CreateTattoos < ActiveRecord::Migration[7.0]
  def change
    create_table :tattoos do |t|
      t.string :title
      t.string :specialization
      t.string :tattoo_image
      t.integer :user_id
      t.string :slug

      t.references :master, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tattoos, :slug, unique: true
  end
end
