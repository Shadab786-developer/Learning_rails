class CustomLogger
  def after_save(record)
    Rails.logger.info("Custom Logger after_save triggered for #{record.user_name}")
  end
end


class User < ApplicationRecord
  # self.table_name = "user"
  # self.primary_key = "customer_id"

  # THERE IS THE VALIDATION WHICH IS DECIDING WHEN THE DATA WAS SAVE INTO THE DATA BASE THERE ARE MANY TYPE OF VALIDATION LIKE uniquness , confirm, custom etc I USE THE PRESENCE VALIDATION HERE.
  validates :user_name, presence: true

  # THESE IS THE CALLBACK METHOD WHICH IS COMES INTO THE ACTIVE RECORD THERE ARE MANY TYPE OF CALLBACK MAINLY ARE after, before , around etc
  #Call back registration
  after_create :log_new_user
  before_validation :titleize_name
  around_save :log_saving
  before_update :update_user
  before_destroy :delete_user


  after_initialize do |user|
    Rails.logger.info("You have initialized an object!")
  end

  after_find do |user|
    Rails.logger.info("You have found an object!")
  end

   after_touch do
    Rails.logger.info("You have touched an object")
  end


  #TRANSACTION CALLBACK
  before_commit :before_commit_callback
  after_commit :after_commit_callback
  after_rollback :after_rollback_callback


  #CALLBACK FOR ASSOCIATION
  has_many :book_orders, before_add: :before_adding_book_order, after_add: :after_adding_book_order , before_remove: :before_removing_book_order, after_remove: :after_removing_book_order

  #CUSTOM CALLBACK
  after_save CustomLogger.new

  private
    def log_new_user
      puts "A new user was registered"
    end

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

  def titleize_name
    self.user_name = user_name.downcase.titleize if user_name.present?
    Rails.logger.info("Name titleized to #{user_name}")
  end

  def log_saving
  Rails.logger.info("User saving with these user name #{user_name}")
  yield
  Rails.logger.info("User saved with these user name #{user_name}")
  end

  def update_user
  Rails.logger.info("The information these user #{user_name} was here to update:-")
  end

  def delete_user
  Rails.logger.info("The user #{user_name} was destroy :-")
  end

  #TRANSACTION CALLBACK METHOD
  def before_commit_callback
    Rails.logger.info("Before commit callback called :-")
  end
  
  def after_commit_callback
      Rails.logger.info("After commit callback called :-")
  end

  def after_rollback_callback
      Rails.logger.info("After rollback callback called :-")
  end

  #CALLBACK FOR ASSOCIATION METHODS
  def before_adding_book_order(book_order)
    Rails.logger.info("Before adding book order #{book_order.id} to user #{user_name} :-")
  end

  def after_adding_book_order(book_order)
    Rails.logger.info("After adding book order #{book_order.id} to user #{user_name} :-")
  end

  def before_removing_book_order(book_order)
    Rails.logger.info("Before removing book order #{book_order.id} from user #{user_name} :-")
  end

  def after_removing_book_order(book_order)
    Rails.logger.info("After removing book order #{book_order.id} from user #{user_name} :-")
  end

end
