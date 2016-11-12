class Workshop < ApplicationRecord
  has_and_belongs_to_many :teachers

  def name
    "#{teachers.map(&:name).join(", ")} - #{held_on}"
  end
end
