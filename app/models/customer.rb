class Customer < ApplicationRecord
  validates :customer_email ,  presence: true
  validates :password , confirmation: true
  validates :password_confirmation, presence: true, if: :password_changed?
  validates :customer_email, format:{with: /[a-z]+\d+@gmail\.com/, message:"Only allow these type of pattern"}
end
