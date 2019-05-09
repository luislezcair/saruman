# frozen_string_literal: true

class TechnicalServiceCorporateCellphone < ApplicationRecord
  belongs_to :corporate_cellphone
  belongs_to :technical_service
end
