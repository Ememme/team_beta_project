class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  if AdminUser.blank?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  end
end
