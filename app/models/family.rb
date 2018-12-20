class Family < ApplicationRecord
  belongs_to :producer
  scope :sorted, -> { order(:name) }
end
