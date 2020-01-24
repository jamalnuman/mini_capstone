class ChangeColumnOnProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :stock, :in_stock
  end
end
