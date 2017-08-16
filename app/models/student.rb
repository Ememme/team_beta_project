class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :tenancy_contract
  has_one :room, through: :tenancy_contract
  has_and_belongs_to_many :expenses, join_table: :contributor_expenses

  validates :nickname, presence: true
  validates :email, uniqueness: true, presence: true
  validates :id_number, presence: true,
                        uniqueness: true

end
