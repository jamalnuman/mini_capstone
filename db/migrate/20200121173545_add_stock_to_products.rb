class AddStockToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :stock, :boolean
  end
end
