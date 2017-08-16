class Room < ApplicationRecord
  has_many :tenancy_contracts
  has_many :students, through: :tenancy_contracts
  has_many :announcements

  validates :capacity, presence: true
  validates :number, presence: true, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 150}
end
