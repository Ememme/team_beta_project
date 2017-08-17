class AddPriceAndDividedPriceToExpense < ActiveRecord::Migration[5.1]
  def change
    change_table :expenses do |t|
      t.float :price
      t.float :divided_price
    end
  end
end
