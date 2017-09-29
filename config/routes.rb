Rails.application.routes.draw do
  resources :positions
  resources :candidates
  resources :voters

  scope '/api' do
    get 'candidates', to: 'candidates#to_json'
    get 'voters', to: 'voters#to_json'
  end
end
