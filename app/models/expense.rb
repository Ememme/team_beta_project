class Expense < ApplicationRecord
  has_and_belongs_to_many :students, join_table: :contributor_expenses

  validates :purchaser_id, presence: true
  validates :category, inclusion: { in: %w(alcohol food cleaners entertainment other),
    message: "%{value} is not a valid category (do poprawienia)" }

  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
  validates :divided_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
end
