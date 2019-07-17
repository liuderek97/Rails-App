class RemoveProfileRefFromShoe < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shoes, :profile, foreign_key: true
  end
end
