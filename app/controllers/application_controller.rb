class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  after_filter :set_csrf_for_angular
  
private

  def set_csrf_for_angular
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    csrf_token = request.headers['HTTP_X_XSRF_TOKEN']
#    Rails.logger.info("RECEIVED X-XSRF-TOKEN: #{csrf_token}")
#    Rails.logger.info("INTERNAL CSRF-TOKEN: #{form_authenticity_token}")
    super || form_authenticity_token == csrf_token
  end

  def failure(message = 'Authentication required', status = 401)
    warden.custom_failure!
    render status: status,
      json: {
        success: false,
        info: message,
        data: {}
      }
  end

  def reject_unauthorized_request!
#    Rails.logger.info("User Session: #{user_session}")
    Rails.logger.info("Current User: #{current_user}")
    Rails.logger.info("User signed in? #{user_signed_in?}")
    return failure unless user_signed_in?
    true
  end

end
