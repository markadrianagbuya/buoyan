class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :student, foreign_key: true
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
