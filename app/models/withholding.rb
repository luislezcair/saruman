# frozen_string_literal: true

class Withholding < ApplicationRecord
  belongs_to :provider
  belongs_to :withholding_tax


end
