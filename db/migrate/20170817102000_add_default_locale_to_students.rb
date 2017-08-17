class AddDefaultLocaleToStudents < ActiveRecord::Migration[5.1]
  def change
    change_column_default :students, :locale, "pl"
  end
end
