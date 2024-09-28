class TextRedactionService
  def initialize(text, words)
    @text = text
    @words = words
  end

  def redact
    @words.each do |word|
      @text = @text.gsub(/\b#{word}\b/i, 'REDACTED')
    end
    @text
  end
end
