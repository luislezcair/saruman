class Deposit < ApplicationRecord
  extend Enumerize
  validates :name, presence: :true

  enumerize :type, in: [:office, :vehicle]
end
