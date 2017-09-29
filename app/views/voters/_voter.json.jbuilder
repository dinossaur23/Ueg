json.extract! voter, :id, :name, :cpf, :date_of_birth, :gender, :created_at, :updated_at
json.url voter_url(voter, format: :json)
