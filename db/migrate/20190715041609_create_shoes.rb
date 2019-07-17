class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.float :price
      t.date :release_date
      t.text :description
      t.float :size
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
