class AddFeedbackImageToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :feedback_image, :string
  end
end
