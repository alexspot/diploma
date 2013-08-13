class AddStatusToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :status, :integer, :default => 0
  end
end
