class AddCategoryRefToListings < ActiveRecord::Migration[7.0]
  def change
    add_reference :listings, :category, null: false, foreign_key: true
  end
end
