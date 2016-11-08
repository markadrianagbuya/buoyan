class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.date :held_on

      t.timestamps
    end
  end
end
