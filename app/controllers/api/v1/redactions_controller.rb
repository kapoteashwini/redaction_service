module Api
  module V1
    class RedactionsController < ApplicationController
      skip_before_action :verify_authenticity_token, unless: -> { request.format.html? }
      
      def create
        text = params[:text]
        redaction_words = RedactionWord.pluck(:word)
        redacted_text = TextRedactionService.new(text, redaction_words).redact

        render plain: "#{redacted_text}\n"
      end
    end
  end
end
