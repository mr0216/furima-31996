class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :comments

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
