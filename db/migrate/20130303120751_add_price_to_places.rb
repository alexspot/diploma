class AddPriceToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :price, :string
  end
end
