class User < ApplicationRecord
  # self.table_name = "user"
  # self.primary_key = "customer_id"

  def self.perform_curd
  # PERFORMING AN CURD OPERATION

  # 1. CREATE
  user = User.create(user_name: "Shadab Qureshi")

  # 2. READE
  puts "All user :"
  puts User.all.inspect
  puts "Find by id :"
  puts User.find(2).inspect

  # 3. UPDATE
  user.update(user_name: "Harish Ansari")
  puts "After Update :"
  puts User.find(2).inspect

  # 4. DELETING
  user.destroy
  puts "After Delete :"
  puts User.all.inspect
end
end
