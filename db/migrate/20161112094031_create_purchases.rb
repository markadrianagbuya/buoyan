class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :package, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
