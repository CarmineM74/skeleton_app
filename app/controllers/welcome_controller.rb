class WelcomeController < ApplicationController
  before_filter :authenticate_user_from_token!, except: [:index]
  layout :choose_layout

  def index
    headers['Authorization'] = "Token #{current_user.auth_token}" if user_signed_in?
  end

private

  def choose_layout
    user_signed_in? ? "angular" : "application"
  end

end
