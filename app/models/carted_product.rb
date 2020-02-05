class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product 
  belongs_to :order, optional: true #an order number exist and must be in sequence..this protects from this 
end
