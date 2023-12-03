json.extract! feedback, :id, :comment, :rating, :user_id, :master_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
