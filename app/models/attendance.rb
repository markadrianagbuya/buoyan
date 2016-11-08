class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :workshop
end
