class MoveDetail < ApplicationRecord
  belongs_to :inventory
  belongs_to :move
end
