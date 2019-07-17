class AddSellerIdToShoe < ActiveRecord::Migration[5.2]
  def change
    add_column :shoes, :seller_id, :integer
  end
end
