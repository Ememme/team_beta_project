class Announcement < ApplicationRecord
  belongs_to :student
  belongs_to :room

  has_many :comments

  validates :news_body , presence: true
  validates :news_body, length: { minimum: 20 }
end
