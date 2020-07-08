class Product
  attr_reader :category, :name
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
  end
end
