class AttendanceRecording < ApplicationRecord
  belongs_to :student
  belongs_to :workshop

  def record_attending
    record(true, 1)
  end
  
  def record_absent
    record(false, -1)
  end

  private

  def record(attending, passes_consumed)
    self.transaction do
      attendance = Attendance.where(student_id: student_id, workshop_id: workshop_id).first_or_create
      attendance.update_attributes!(attending: attending)
      student.update_attributes!(passes_remaining: student.passes_remaining - passes_consumed)
      ClassPassTransaction.create!(student: student, delta: -passes_consumed)
      self.attending = attending
      self.save
    end
  end
end
