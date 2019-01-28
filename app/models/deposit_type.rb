class DepositType < ApplicationRecord
    has_many :deposits
    # belongs_to :city
    scope :sorted, -> { order(:name) }
end
    