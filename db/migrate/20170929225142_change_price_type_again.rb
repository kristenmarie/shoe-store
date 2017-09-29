class ChangePriceTypeAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price)
    add_column(:brands, :price, :integer)
  end
end
