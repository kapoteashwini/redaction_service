require 'logger'

REDACTION_LOGGER = Logger.new(Rails.root.join('log/redaction.log')).tap do |logger|
	logger.formatter = Logger::Formatter.new
end
