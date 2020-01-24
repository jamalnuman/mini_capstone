class Product < ApplicationRecord

  belongs_to: supplier
  # def supplier 
  #   Supplier.find_by(id: self.supplier_id)  
  # end



  validates :name, presence: true #this doesn't allow an instance to be created without a name
  validates :name, uniqueness: true #only can one name of the same value
  validates :name, length: { maximum: 255 } 
  validates :image_url, length: { maximum: 255 }
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
