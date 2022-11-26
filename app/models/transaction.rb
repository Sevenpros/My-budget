class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amouunt, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
