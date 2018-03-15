class Product < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :region, presence: true

end
