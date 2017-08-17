class ContributorExpense < ApplicationRecord
has_one :student
has_one :expense
end
