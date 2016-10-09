json.extract! individual_review, :id, :user_id, :created_at, :updated_at
json.url individual_review_url(individual_review, format: :json)