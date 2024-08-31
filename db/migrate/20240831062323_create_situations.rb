class CreateSituations < ActiveRecord::Migration[6.1]
  def change
    create_table :situations do |t|
      t.string :situation

      t.timestamps
    end
  end
end
