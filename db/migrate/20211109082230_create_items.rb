class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :review_id
      t.string :item_name
      t.integer :JAN_code

      t.timestamps
    end
  end
end
