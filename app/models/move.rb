class Move < ApplicationRecord
  belongs_to :user_register, :class_name => "User"
  belongs_to :user_take, :class_name => "User"
  has_many :move_details
end
