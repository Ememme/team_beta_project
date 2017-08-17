class TenancyContract < ApplicationRecord
  belongs_to :student
  belongs_to :room

  validate :ensure_room_not_full
  # , :only_students_without_contract

  private

  def ensure_room_not_full
    if self.room.tenancy_contracts.size >= self.room.capacity
      errors.add(:room, I18n.t('activerecord.errors.too_many_contracts', room_id: self.room.id))
    end
  end

  # def only_students_without_contract
  #   if !self.student.tenancy_contract.persisted?
  #     errors.add(:student, I18n.t('activerecord.errors.already_has_contract', student: self.student.full_name))
  #   end
  # end
end
