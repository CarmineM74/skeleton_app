class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :timeoutable

  before_create :ensure_authentication_token
  has_many :authorizations, dependent: :destroy

  def ensure_authentication_token
    self.auth_token = generate_auth_token if auth_token.blank?
  end

private

  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_auth_token(token)
    end
  end

end
