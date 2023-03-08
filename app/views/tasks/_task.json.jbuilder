json.extract! task, :id, :comments_count, :caption, :owner_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
