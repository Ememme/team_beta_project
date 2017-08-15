require "administrate/field/base"

class TenancyContractRentField < Administrate::Field::Base
  def to_s
    self.data.rent
  end
end
