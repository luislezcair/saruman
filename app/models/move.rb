class Move < ApplicationRecord
  belongs_to :site_from, :class_name => "Deposit"
  belongs_to :site_to, :class_name => "Deposit"
  belongs_to :user_register, :class_name => "User"
  belongs_to :user_take, :class_name => "User"
end
