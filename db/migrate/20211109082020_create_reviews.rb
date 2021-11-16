class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :title,           null: false
      t.string :review_image_id, null: false
      t.text :review_content,    null: false
      t.float :rate,             null: false

      t.timestamps
    end
  end
end
