Rails.application.routes.draw do
  post '/redact', to: 'api/v1/redactions#create'
  get '/redact', to: 'api/v1/redactions#show' 
  match '*unmatched', to: 'errors#not_found', via: :all
end
