class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_filter :reject_unauthorized_request!
  
  def current_user
    
  end

  def destroy

  end

private

  def reject_unauthorized_request!
    return failure unless user_signed_in?
    true
  end


end

