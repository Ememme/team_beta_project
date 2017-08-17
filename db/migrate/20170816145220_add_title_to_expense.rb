class AddTitleToExpense < ActiveRecord::Migration[5.1]
  def change
    change_table :expenses do |t|
      t.string :title
    end
  end
end
