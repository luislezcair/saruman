class Address < ApplicationRecord
    belongs_to :provider, optional:true
end
  