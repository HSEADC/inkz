class AddTattooImageToTattoo < ActiveRecord::Migration[7.0]
  def change
    add_column :tattoos, :tattoo_image, :string
  end
end
