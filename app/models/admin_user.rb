class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  include DeviseInvitable::Inviter
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
end
