class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_many :carted_products

  
  validates :email, presence: true, uniqueness: true

  def cart #this method will be executed on a user object, such as current_user, so it makes sense create this in the user's model ..'self' is implied in this method
    carted_products.where(status: 'carted')
  end
end
