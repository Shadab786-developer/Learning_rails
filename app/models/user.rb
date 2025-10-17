class User < ApplicationRecord
  # self.table_name = "user"
  # self.primary_key = "customer_id"

  # THERE IS THE VALIDATION WHICH IS DECIDING WHEN THE DATA WAS SAVE INTO THE DATA BASE THERE ARE MANY TYPE OF VALIDATION LIKE uniquness , confirm, custom etc I USE THE PRESENCE VALIDATION HERE.
  validates :user_name, presence: true

  # THESE IS THE CALLBACK METHOD WHICH IS COMES INTO THE ACTIVE RECORD THERE ARE MANY TYPE OF CALLBACK MAINLY ARE after, before , around etc

  after_create :log_new_user

  
  # that helps to connect multiple database tables with each other
  # through their models. This allows objects to be related in
  # a natural and easy-to-use way without writing complex SQL JOINs.
  # here are mainly six types of associations:
  #   1. belongs_to       → Indicates that this model contains a foreign key.
  #   2. has_one          → Indicates that this model owns one related record.
  #   3. has_many         → Indicates that this model owns many related records.
  #   4. has_many :through→ Used for many-to-many relationships with a join table.
  #   5. has_one :through → Used when a model is connected through another model.
  #   6. has_and_belongs_to_many → Simple many-to-many without a separate model.

  has_many :posts, foreign_key: "user_id", dependent: :destroy
  


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
  private
    def log_new_user
      puts "A new user was registered"
    end
end
