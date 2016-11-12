class AddNotesToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :notes, :text
  end
end
