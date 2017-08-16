class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :tenancy_contract
  has_one :room, through: :tenancy_contract
  has_many :announcements

  validates :nickname, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 5, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ },
                                     length: { maximum: 30 }
  validates :id_number, presence: true,
                        uniqueness: true,
                        format: { with: /\A[A-Z0-9]+\z/ }

end
