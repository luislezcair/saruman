# frozen_string_literal: true

class TaxCategory < ApplicationRecord
has_many :providers

validates :name, presence: :true
end
 