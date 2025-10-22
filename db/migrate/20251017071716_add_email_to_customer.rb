class AddEmailToCustomer < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :customer_email,:string
    add_index :customers, :customer_email
    add_column :customers, :customer_feedback ,:string
  end
end
