# frozen_string_literal: true

class Contact < ApplicationRecord
	belongs_to :provider, optional: true
	belongs_to :telephone_type, optional: true
end
 