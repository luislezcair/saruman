# frozen_string_literal: true

class Producer < ApplicationRecord
  has_many :products, dependent: :restrict_with_error
  validates :name, presence: :true
  scope :sorted, -> { order(:name) }
end
