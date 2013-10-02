class MainController < ApplicationController
  before_filter :authenticate_user_from_token!
#  before_filter :authenticate_user!

  def index
  end

end
