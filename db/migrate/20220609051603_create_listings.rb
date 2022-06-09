class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.string :condition

      t.timestamps
    end
  end
end
