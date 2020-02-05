class Order < ApplicationRecord
  #belongs_to :product
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products

  
end













# def calculate_subtotal
  #   self.subtotal = product.price * quantity
  # end
  # #self keyword has to be used cause without it, subtotal will be seen as a local variable and not an attribute on the order object. the self keyword is referring to the order object that is created by a user. 
  # def calculate_tax
  #   self.tax = subtotal * 0.09
  # end

  # def calculate_total
  #   self.total = subtotal + tax
  # end

  # def calculate_totals
  #   calculate_subtotal
  #   calculate_tax
  #   calculate_total
  # end



# class Order < ApplicationRecord
#   belongs_to :product
#   belongs_to :user



#   def subtotal
#     product.price * quantity
#   end

#   def tax
#     subtotal * 0.09
#   end

#   def total
#     subtotal + tax
#   end
# end 
