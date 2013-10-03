class WelcomeController < ApplicationController
  layout :choose_layout

  def index
  end

private

  def choose_layout
    user_signed_in? ? "angular" : "application"
  end

end
