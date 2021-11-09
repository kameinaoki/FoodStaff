class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :title
      t.text :review_content
      t.float :rate

      t.timestamps
    end
  end
end
