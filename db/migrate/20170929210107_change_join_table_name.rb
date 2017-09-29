class ChangeJoinTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :associations, :brands_stores
  end
end
