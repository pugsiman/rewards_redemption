class Reward < ApplicationRecord
  has_many :redemptions, dependent: :nullify # always keep records of redemptions
  has_many :users, through: :redemptions

  validates :name, presence: true, uniqueness: true
  validates :cost, numericality: { greater_than_or_equal: 0 } # NOTE: this fiedld is specified by cents
  validates :inventory_amount, numericality: { greater_than_or_equal: 0 }
  validates :available, inclusion: [true, false]

  scope :available, -> { where(available: true) }
end
