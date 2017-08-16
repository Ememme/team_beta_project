class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.text :news_body
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
