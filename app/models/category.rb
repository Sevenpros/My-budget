class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  include ImageUploader::Attachment(:icon)
  validates :name, presence: true
  validates :icon, presence: true
end
