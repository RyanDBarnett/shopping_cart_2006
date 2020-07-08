class Product
  attr_reader :category
  def initialize(category, name, unit_price, quantity)
    @category = category
  end
end
