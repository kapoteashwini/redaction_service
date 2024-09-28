class ApplicationController < ActionController::Base
  # Rescue from not found error globally
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  ''' 
  As of now as we have only one logger file so added in the application controller.
  For complex/vast projects requirements can move this method to the specific controllers
  '''
  def print_log(text)
    REDACTION_LOGGER.info("#{Time.now}: #{text}\n")
  end
end
