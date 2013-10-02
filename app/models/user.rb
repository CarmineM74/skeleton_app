class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :validatable,
         :omniauthable, :timeoutable

  has_many :authorizations, dependent: :destroy
end
