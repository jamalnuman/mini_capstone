class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products


  has_many :product_categories
  has_many :categories, through: :product_categories
   
  # def supplier 
  #   Supplier.find_by(id: self.supplier_id) #in other words...product = Product.first
                                                              #product.supplier_id 
  # end



  validates :name, presence: true #this doesn't allow an instance to be created without a name
  validates :name, uniqueness: true #only can one name of the same value
  validates :name, length: { maximum: 255 } 
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 100_000} #price is a number and give a range 
  validates :description, length: { minimum: 10, maximum: 500 }#these can take multiple key value pairs
                                    #{ in: 10..500 } same thing as above for minimum and maximum..the error message will be 'you are under the limit' or 'above the limit'
  
 

  def is_discounted?
    # discounted = price < 10 ? true : false
    # discounted
    price < 8
  end

  def tax
    price * 0.09
  end 

  def total
    price + tax
  end
 end
