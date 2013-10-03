class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_filter :reject_unauthorized_request!
  
  def current_user_info 
    render status: 200,
      json: {
        success: true,
        info: 'current user info',
        data: {
          user: current_user
        }   
      }
  end

  def destroy
    current_user.update_column(:auth_token, nil)
    sign_out current_user
    render status: 200,
      json: {
        success: true,
        info: 'Logged out',
        data: {}
      } 
  end

private

  def reject_unauthorized_request!
#    Rails.logger.info("User Session: #{user_session}")
#    Rails.logger.info("Current User: #{current_user}")
#    Rails.logger.info("User signed in? #{user_signed_in?}")
    return failure unless user_signed_in?
    true
  end


end

