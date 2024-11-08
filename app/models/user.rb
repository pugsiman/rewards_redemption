class User < ApplicationRecord
  has_many :redemptions, dependent: :nullify # always keep records of redemptions
  has_many :rewards, through: :redemptions

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :credits_amount, numericality: { greater_than_or_equal: 0 } # NOTE: specified by cents
end
