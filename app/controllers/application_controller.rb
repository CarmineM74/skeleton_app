class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
private

  def failure(message = 'Authentication required', status = 401)
    warden.custom_failure!
    render status: status,
      json: {
        success: false,
        info: message,
        data: {}
      }
  end

  def authenticate_user_from_token!
    Rails.logger.info "Authenticating from token ..."
    authenticate_with_http_token do |token, options|
      Rails.logger.info "Token: #{token} - Opts: #{options}"
      @user = User.find_by_auth_token(token)
      if @user && Devise.secure_compare(@user.auth_token,token)
        sign_in @user, store: false
      end
    end
    Rails.logger.info "Request XHR?: #{request.format}"
    return failure if request.format.xhr?
    redirect_to '/login' and return false
  end

end
