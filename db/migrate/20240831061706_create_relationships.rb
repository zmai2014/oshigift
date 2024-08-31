class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.string :relationship

      t.timestamps
    end
  end
end
