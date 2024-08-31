class CreatePostSituations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_situations do |t|
      t.integer :post_id
      t.integer :situation_id

      t.timestamps
    end
  end
end
