Rails.application.routes.draw do
  resources :votes
  resources :elections
  resources :positions
  resources :candidates
  resources :voters
  resources :uevs

  scope '/api' do
    get ':id/candidates', to: 'candidates#to_json'
    get ':id/voters', to: 'voters#to_json'
    get ':id/election', to: 'elections#to_json'
  end
end
