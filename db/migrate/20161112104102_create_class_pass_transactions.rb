class CreateClassPassTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :class_pass_transactions do |t|
      t.references :student, foreign_key: true
      t.integer :delta

      t.timestamps
    end
  end
end
