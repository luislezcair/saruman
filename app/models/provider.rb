class Provider < ApplicationRecord
	has_many :contacts
	accepts_nested_attributes_for :contacts, allow_destroy: true
end
