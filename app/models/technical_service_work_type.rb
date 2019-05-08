# frozen_string_literal: true

class TechnicalServiceWorkType < ApplicationRecord
  belongs_to :technical_service
  belongs_to :work_type
end
