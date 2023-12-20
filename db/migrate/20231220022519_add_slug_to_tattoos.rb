class AddSlugToTattoos < ActiveRecord::Migration[7.0]
  def change
    add_column :tattoos, :slug, :string
    add_index :tattoos, :slug, unique: true
  end
end
