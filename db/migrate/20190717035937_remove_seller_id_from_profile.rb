class RemoveSellerIdFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :seller_id, :integer
  end
end
