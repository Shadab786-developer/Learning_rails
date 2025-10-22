class AddUserProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :book_orders , :users , null: false , foreign_key: true
    change_column :products, :part_number, :text
  end
end
