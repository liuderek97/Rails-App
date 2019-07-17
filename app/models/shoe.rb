class Shoe < ApplicationRecord

  belongs_to :buyer,  class_name: 'Profile',  foreign_key: "buyer_id", optional: true
  belongs_to :seller, class_name: 'Profile',  foreign_key: "seller_id"
  has_many_attached :pictures

end
