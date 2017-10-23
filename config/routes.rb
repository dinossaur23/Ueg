Rails.application.routes.draw do
  resources :elections
  resources :positions
  resources :candidates
  resources :voters
  resources :uevs

  scope '/api' do
    get ':id/candidates', to: 'candidates#to_json'
    get ':id/voters', to: 'voters#to_json'
  end
end
