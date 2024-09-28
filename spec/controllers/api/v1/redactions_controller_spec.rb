require 'rails_helper'

RSpec.describe Api::V1::RedactionsController, type: :controller do
  let(:redaction_words) { ['dog', 'dolphin'] }
  let(:input_text) { 'A dog, a dolphin, and a cat are animals.' }
  let(:redacted_text) { 'A REDACTED, a REDACTED, and a cat are animals.' }

  before do
    allow(RedactionWord).to receive(:pluck).and_return(redaction_words)
  end

  # POST API
  describe 'POST #create' do
    it 'redacts specified words from the input text' do
      request.headers['CONTENT_TYPE'] = 'text/plain'
      post :create, body: input_text

      expect(response.body).to eq(redacted_text)
      expect(response).to have_http_status(:ok)
    end
  end

  # GET API
  describe 'GET #show' do
    it 'returns "Redaction Service"' do
      get :show

      expect(response.body).to eq('Redaction Service')
      expect(response).to have_http_status(:ok)
    end
  end
end
