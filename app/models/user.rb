class User < ApplicationRecord
  has_many :redemptions, dependent: :nullify # always keep records of redemptions
  has_many :rewards, through: :redemptions

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
