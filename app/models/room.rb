class Room < ApplicationRecord
  has_many :tenancy_agreements
  has_many :students, through: :tenancy_agreements

  validates :capacity, :number, presence: true
end
