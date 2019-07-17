class RemoveBuyerIdFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :buyer_id, :integer
  end
end
