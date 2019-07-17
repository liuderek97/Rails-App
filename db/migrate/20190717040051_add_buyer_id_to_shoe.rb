class AddBuyerIdToShoe < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :buyer_id, :integer
  end
end
