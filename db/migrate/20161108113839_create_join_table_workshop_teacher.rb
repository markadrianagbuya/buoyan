class CreateJoinTableWorkshopTeacher < ActiveRecord::Migration[5.0]
  def change
    create_join_table :workshops, :teachers do |t|
      t.index [:workshop_id, :teacher_id]
      t.index [:teacher_id, :workshop_id]
    end
  end
end
