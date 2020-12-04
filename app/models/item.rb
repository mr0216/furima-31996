class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :estimated_shipping_date

  with_options numericality: { other_than: 1, message: 'Select.' } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :comments

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, 
                                      message: 'Out of setting range' }
  end
  
end

# VALID_PRICEL_REGEX =  /\A[0-9]+\z/
# {with: /\A[0-9]+\z/, message: 'Half-width number'}
