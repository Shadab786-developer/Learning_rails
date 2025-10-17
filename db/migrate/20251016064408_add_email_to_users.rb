class AddEmailToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
      add_column :users , :password ,:string
    add_index :users, :user_name
   add_reference :users, :book_orders , null: false , foreign_key: true 
  end
end
