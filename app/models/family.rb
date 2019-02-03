class Family < ApplicationRecord
  belongs_to :producer
  scope :sorted, -> { order(:name) }
  validates :name, presence: :true
end
 