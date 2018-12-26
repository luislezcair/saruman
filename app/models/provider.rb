class Provider < ApplicationRecord
	has_many :contacts, dependent: :destroy
	accepts_nested_attributes_for :contacts, allow_destroy: true
end
