class AddAttendingToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :attending, :boolean

    # Attendances previously resembled attending students
    Attendance.update_all(attending: true)
  end
end
