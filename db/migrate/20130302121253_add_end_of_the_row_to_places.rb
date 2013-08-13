class AddEndOfTheRowToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :end_row, :boolean, default: false
  end
end
