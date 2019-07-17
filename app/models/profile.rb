class Profile < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :user_name, presence: true

  belongs_to :user
  has_many :shoes_for_sale, class_name: 'Shoe', foreign_key: 'seller_id'
  has_many :shoes_purchased, class_name: 'Shoe', foreign_key: 'buyer_id'
end
