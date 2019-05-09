# frozen_string_literal: true

class TelephoneType < ApplicationRecord
    scope :sorted, -> { order(:name) }
end
