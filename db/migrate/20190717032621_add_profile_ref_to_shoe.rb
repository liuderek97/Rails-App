class AddProfileRefToShoe < ActiveRecord::Migration[5.2]
  def change
    add_reference :shoes, :profile, foreign_key: true
  end
end
