class Purchase < ApplicationRecord
  belongs_to :package
  belongs_to :student
end
