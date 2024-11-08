class Redemption < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  validates :paid_amount, numericality: { only_integer: true } # NOTE: amount paid in actuality. cost could differ in a point in time
end
