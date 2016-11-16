class CreateAttendanceRecordings < ActiveRecord::Migration[5.0]
  def change
    create_table :attendance_recordings do |t|
      t.boolean :attending
      t.references :student, foreign_key: true
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
