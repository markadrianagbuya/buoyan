class AddPassesRemainingToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :passes_remaining, :integer
  end
end
