class AddOrderIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :order_id, :integer
  end
end
