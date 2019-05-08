# frozen_string_literal: true

class VoucherType < ApplicationRecord

    validates :name, presence: :true

    scope :sorted, -> { order(:name) }
end
