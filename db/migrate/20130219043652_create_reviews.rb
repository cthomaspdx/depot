class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :product

      t.timestamps
    end
    add_index :reviews, :product_id
  end
end
