class ChangePriceToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :price, nil
  end
end
