class AddDefaultRentValueToTenancyContracts < ActiveRecord::Migration[5.1]

  def change
    change_column_default :tenancy_contracts, :rent, 0
  end

end
