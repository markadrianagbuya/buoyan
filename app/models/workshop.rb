class Workshop < ApplicationRecord
  has_and_belongs_to_many :teachers
  has_many :attendances
  has_many :students, through: :attendances, source: :student

  def name
    "#{teachers.map(&:name).map(&:capitalize).join(", ")} - #{held_on.strftime('%d %B %Y')}"
  end

  def attendees
    students.map{ |student| Attendee.new(student) }
  end
end
