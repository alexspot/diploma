class AddEventIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :event_id, :integer
  end
end
