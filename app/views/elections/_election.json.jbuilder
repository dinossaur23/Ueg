json.extract! election, :id, :code, :init, :finish, :created_at, :updated_at
json.url election_url(election, format: :json)
