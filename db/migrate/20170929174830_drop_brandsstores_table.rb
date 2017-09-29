class DropBrandsstoresTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :brands_stores
  end
end
