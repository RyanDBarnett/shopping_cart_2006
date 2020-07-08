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

  def products_by_category(category)
    @products.select { |product| product.category == category }
  end

  def percentage_occupied
    percentage = ((total_number_of_products.to_f / @capacity) * 100).round(2)

    if (percentage > 100)
      return 100
    end

    percentage
  end

  def sorted_products_by_quantity
    @products.sort {|productA, productB| productB.quantity <=> productA.quantity}
  end
end
