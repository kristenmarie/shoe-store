class DropStoresBrandsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :stores_brands
  end
end
