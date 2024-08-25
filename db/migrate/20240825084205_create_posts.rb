class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :item_name
      t.text :introduction
      t.integer :age, defalut: 0
      t.integer :gender, defalut: 0
      t.integer :price, defalut: 0
      t.float :star

      t.timestamps
    end
  end
end
