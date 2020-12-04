class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :estimated_shipping_date

  validates :category_id, numericality: { other_than: 1,
                                          message: 'Select.' }

  validates :condition_id, numericality: { other_than: 1,
                                           message: 'Select.' }

  validates :postage_id, numericality: { other_than: 1,
                                         message: 'Select.' }

  validates :prefecture_id, numericality: { other_than: 1,
                                            message: 'Select.' }

  validates :estimated_shipping_date_id, numericality: { other_than: 1,
                                                         message: 'Select.' }

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :comments

  validates :name, presence: true
  validates :introduction, presence: true

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 99_999_999, message: 'Out of setting range' }

  validates :image, presence: true
end

# VALID_PRICEL_REGEX =  /\A[0-9]+\z/
# {with: /\A[0-9]+\z/, message: 'Half-width number'}
