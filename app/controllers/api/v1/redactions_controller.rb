module Api
  module V1
    class RedactionsController < ApplicationController
      def create
        text = request.body.read
        redaction_words = RedactionWord.pluck(:word)
        redacted_text = TextRedactionService.new(text, redaction_words).redact
        REDACTION_LOGGER.info("#{Time.now}: #{text}\n")
        render plain: redacted_text
      end

      def show
        render plain: 'Redaction Service'
      end
    end
  end
end
