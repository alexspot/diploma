class AddMiscToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :place_number, :integer
    add_column :orders, :place_id, :integer
    add_column :orders, :price, :integer
  end
end
