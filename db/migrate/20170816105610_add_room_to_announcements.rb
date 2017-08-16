class AddRoomToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_reference :announcements, :room, foreign_key: true, index: true
  end
end
