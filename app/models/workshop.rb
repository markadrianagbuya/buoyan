class Workshop < ApplicationRecord
  has_and_belongs_to_many :teachers
  has_many :attendances
  has_many :students, through: :attendances, source: :student

  def name
    "#{teachers.map(&:name).map(&:capitalize).join(", ")} - #{held_on.strftime('%d %B %Y')}"
  end

  def attendees
    attendances.where(attending: true).map{|attendance| Attendee.new(attendance.student, attendance) }
  end
end
