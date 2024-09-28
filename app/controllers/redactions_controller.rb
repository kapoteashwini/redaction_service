class RedactionsController < ApplicationController
  def create
    text = request.body.read || params[:text]
    redaction_words = RedactionWord.pluck(:word)
    redacted_text = TextRedactionService.new(text, redaction_words).redact

    render plain: redacted_text
  end

  def show
    render plain: 'Redaction Service'
  end
end

