class Contact < ApplicationRecord
	belongs_to :provider, optional: true
end
 