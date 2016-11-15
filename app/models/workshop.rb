class Workshop < ApplicationRecord
  has_and_belongs_to_many :teachers
  has_many :attendances
  has_many :attendees, through: :attendances, source: :student

  def name
    "#{teachers.map(&:name).map(&:capitalize).join(", ")} - #{held_on.strftime('%d %B %Y')}"
  end
end
