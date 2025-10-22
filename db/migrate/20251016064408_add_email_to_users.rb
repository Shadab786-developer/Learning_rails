class AddEmailToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
    add_column :users , :password ,:string
    add_index :users, :user_name
  end
end
