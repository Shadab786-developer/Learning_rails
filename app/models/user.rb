class User < ApplicationRecord
  self.table_name = "user"
  self.primary_key = "customer_id"
end
