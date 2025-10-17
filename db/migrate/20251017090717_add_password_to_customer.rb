class AddPasswordToCustomer < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :password, :string
    add_column :customers, :password_confirmation, :string

  end
end
