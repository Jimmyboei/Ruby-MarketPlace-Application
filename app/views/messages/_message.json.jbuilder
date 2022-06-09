json.extract! message, :id, :text, :is_response, :user_id, :listing_id, :created_at, :updated_at
json.url message_url(message, format: :json)
