class CreateContributorExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :contributor_expenses do |t|
      t.integer :expense_id
      t.integer :contributor_id

      t.timestamps
    end
  end
end
