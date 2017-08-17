class AddPayedToContributorExpense < ActiveRecord::Migration[5.1]
  def change
    change_table :contributor_expenses do |t|
      t.boolean :payed
    end
  end
end
