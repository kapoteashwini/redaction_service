class ApplicationController < ActionController::Base
  # Rescue from not found error globally
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: { error: 'Not Found' }, status: :not_found
  end
end
