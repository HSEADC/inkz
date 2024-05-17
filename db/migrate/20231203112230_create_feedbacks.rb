class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.integer :rating
      t.string :feedback_image
      t.references :user, null: false, foreign_key: true
      t.references :master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
