class TenancyContract < ApplicationRecord
  belongs_to :student
  belongs_to :room
end
