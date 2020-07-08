class ShoppingCart
  attr_reader :name, :capacity, :products, :details
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: @name, capacity: @capacity}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.reduce(0) { |sum, product| sum + product.quantity }
  end

  def is_full?
    total_number_of_products >= @capacity
  end
end
