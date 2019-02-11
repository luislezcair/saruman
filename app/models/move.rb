class Move < ApplicationRecord
  belongs_to :user_register, :class_name => "User"
  belongs_to :user_take, :class_name => "User"
  belongs_to :voucher_type
  has_many :move_details

  
  attr_accessor :site_from, :move_details_attributes
  accepts_nested_attributes_for :move_details

  attribute :move_date, :datetime, default: -> { Time.current }

  validates :voucher_number, presence: :true
  validates :voucher_type, presence: :true
  validates :user_take, presence: :true
  validates :user_register, presence: :true
  validates :move_date, presence: :true

  extend Enumerize

  enumerize :status,  
              in: { en_carga: 0, en_transito: 1, retrasado: 2, recibido: 3, en_espera: 4, eliminado: 5 }, 
              default: :en_carga, 
              predicates: true
end
