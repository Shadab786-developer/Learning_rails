class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :type

      t.timestamps
    end
    add_index :products, :type
  end
end
