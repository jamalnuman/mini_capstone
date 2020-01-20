class Product < ApplicationRecord
  def is_discounted?
    # discounted = price < 10 ? true : false
    # discounted
    price < 10
  end

  def tax
    price * 0.09
  end 

  def total
    price + tax
  end
end
