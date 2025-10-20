class Customer < ApplicationRecord
  validates :customer_email ,  presence: true

  validates :password , confirmation: true
  
  validates :password_confirmation, presence: true, if: :password_changed?,message: "The confirm password should be same for password"
  
  validates :customer_email, format:{with: /[a-z]+\d+@gmail\.com/, message:"Only allow these type of pattern"}

  validates_each :customer_name do |record, attr, value|
    if value.present? && /\A[[:lower:]]/.match?(value)
      record.errors.add(attr,"Must be start with uppercase :-")
      end
  end

  validates_with CustomEmailValidator, field[:customer_email,:customer_feedback]

  validates :customer_feedback, length:{minimum:10, message:"must be atleast 10 character"}, allow_blank: true


  validates password_match , on: :create
  
  private 
  def password_match
    if password.present? && password_confirmation.present? && password != password_confirmation
    Rails.logger.info("The password was not matched :-")
      errors.add(:password_confirmation,"does not match password")
    end
  end
end

