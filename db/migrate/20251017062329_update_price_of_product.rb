class UpdatePriceOfProduct < ActiveRecord::Migration[8.0]
  def change
    def up 
      execute "UPDATE products SET price = 'free'"
    end
    def down
      execute "UPDATE products SET price = 'original_price' WHERE price = 'free';"
    end
  end
end
