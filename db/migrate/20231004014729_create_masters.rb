class CreateMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :masters do |t|
      t.string :name
      t.string :nickname
      t.string :user_id
      t.text :description
      t.integer :experience
      t.string :price_zone
      t.string :city
      t.string :inst
      t.string :vk
      t.string :tg
      t.string :master_image

      t.timestamps
    end
  end
end
