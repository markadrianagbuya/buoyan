class ChangeDefaultValueForClassesRemainingInStudents < ActiveRecord::Migration[5.0]
  def up
    change_column :students, :passes_remaining, :integer, default: 0
    Student.where(passes_remaining: nil).update_all(passes_remaining: 0)
  end
  
  def down
    change_column :students, :passes_remaining, :integer, default: nil
  end
end
