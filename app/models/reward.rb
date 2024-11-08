class Reward < ApplicationRecord
  has_many :redemptions, dependent: :nullify # always keep records of redemptions
  has_many :users, through: :redemptions

  validates :name, presence: true, uniqueness: true
  validates :cost, numericality: { only_integer: true } # NOTE: this fiedld is specified by cents
  validates :inventory_amount, numericality: { only_integer: true }
  validates :available, inclusion: [true, false]
end
