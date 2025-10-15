class User < ApplicationRecord
  self.table_name = "user"
  self.primary_key = "customer_id"

  # THERE IS THE VALIDATION WHICH IS DECIDING WHEN THE DATA WAS SAVE INTO THE DATA BASE THERE ARE MANY TYPE OF VALIDATION LIKE uniquness , confirm, custom etc I USE THE PRESENCE VALIDATION HERE.
  validates :user_name, presence: true

  # THESE IS THE CALLBACK METHOD WHICH IS COMES INTO THE ACTIVE RECORD THERE ARE MANY TYPE OF CALLBACK MAINLY ARE after, before , around etc

  after_create :log_new_user


  def self.perform_curd
    # PERFORMING AN CURD OPERATION

    # 1. CREATE
    user = User.create(user_name: "Shadab Qureshi")

    # 2. READE
    puts "All user :"
    puts User.all.inspect
    puts "Find by id :"
    puts User.find(1).inspect

    # 3. UPDATE
    user.update(user_name: "Harish Ansari")
    puts "After Update :"
    puts User.find(1).inspect

    # 4. DELETING
    user.destroy
    puts "After Delete :"
    puts User.all.inspect
  end
  private
    def log_new_user
      puts "A new user was registered"
    end
end
