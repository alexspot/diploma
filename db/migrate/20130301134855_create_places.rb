class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :hall_id
      t.boolean :status

      t.timestamps
    end
  end
end
