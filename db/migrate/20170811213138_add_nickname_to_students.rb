class AddNicknameToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :nickname, :string, uniqe: true
  end
end
