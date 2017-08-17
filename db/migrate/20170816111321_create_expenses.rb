class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :purchaser_id
      t.string :category
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
