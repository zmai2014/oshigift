class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :item_name, null: false
      t.text :introduction, null: false
      t.integer :age, default: 0
      t.integer :gender, default: 0
      t.integer :price, default: 0
      t.float :star
      t.integer :user_id, null: false
      t.integer :relationship_id

      t.timestamps
    end
  end
end
