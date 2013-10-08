class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    current_user.update_column(:auth_token, nil) if current_user
    sign_out current_user
    render status: 200,
      json: {
        success: true,
        info: 'Logged out',
        data: {}
      } 
  end

end

