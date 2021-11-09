class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :cooking_name
      t.text :recipe_content
      t.text :recipe_image_id

      t.timestamps
    end
  end
end
