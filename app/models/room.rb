class Room < ApplicationRecord
  has_many :tenancy_contracts, dependent: :destroy
  has_many :students, through: :tenancy_contracts
  has_many :announcements

  validates :capacity, presence: true
  validates :number, presence: true, uniqueness: true
  validates :name, allow_blank: true, length: { minimum: 5, maximum: 150}
  validate :max_capacity

  private

  def max_capacity
    if self.students.count > self.capacity
      errors.add(:capacity, I18n.t('activerecord.errors.room_full', capacity: self.capacity))
    end
  end
end
