Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
	post '/redact', to: 'api/v1/redactions#create'
  get '/redact', to: 'api/v1/redactions#show' 
  match '*unmatched', to: 'errors#not_found', via: :all
end
