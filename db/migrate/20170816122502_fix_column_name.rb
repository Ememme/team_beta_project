class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    change_table :contributor_expenses do |t|
      t.rename :contributor_id, :student_id
    end
  end
end
