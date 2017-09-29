json.extract! candidate, :id, :name, :nickname, :number, :image, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
