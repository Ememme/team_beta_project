class AddNameAndDefaultNumberToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :name, :string, default: ""
    change_column_default :rooms, :number, 0
  end
end
