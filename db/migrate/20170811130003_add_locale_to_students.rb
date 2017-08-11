class AddLocaleToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :locale, :string, default: nil
  end
end
