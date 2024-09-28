require 'rails_helper'

RSpec.describe Api::V1::RedactionsController, type: :controller do
  describe 'POST #create' do
    let(:text) { 'This is a secret message with sensitive info' }
    let(:redaction_words) { ['secret', 'sensitive'] }
    let(:redacted_text) { 'This is a [REDACTED] message with [REDACTED] info' }

    before do
      # Stub out RedactionWord pluck method
      allow(RedactionWord).to receive(:pluck).and_return(redaction_words)

      # Stub out TextRedactionService to return redacted text
      allow_any_instance_of(TextRedactionService).to receive(:redact).and_return(redacted_text)
    end

    it 'returns redacted text' do
      post :create, body: text

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(redacted_text)
    end
  end
end
