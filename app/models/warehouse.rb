class WareHouse < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum:140}
  validates :description, presence:true
  validates :address, presence: true
  validates :manager, presence: true
  validates :manager_email, presence: true
  validates :manager_phone_number, presence:true
  validates :region, presence:true

end
