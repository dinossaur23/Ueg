Rails.application.routes.draw do
  resources :votes, only: [:index]
  resources :elections
  resources :candidates
  resources :voters
  resources :uevs
  resources :apurations

  get 'result', to: 'elections#result'

  scope '/api' do
    get ':id/:election/candidates', to: 'candidates#to_json'
    get ':id/:election/voters', to: 'voters#to_json'
    get ':id/elections', to: 'elections#to_json'
    post ':id/votes', to: 'apurations#count'
  end

  root to: 'elections#home'
end
