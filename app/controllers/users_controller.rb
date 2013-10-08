class UsersController < ApplicationController
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

end
