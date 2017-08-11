class CreateTenancyContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :tenancy_contracts do |t|
      t.float :rent
      t.references :student, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
