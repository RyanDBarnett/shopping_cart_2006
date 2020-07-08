class Product
  attr_reader :category, :name, :unit_price, :quantity, :total_price
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @total_price = @quantity * @unit_price
    @hoarded = false
  end

  def is_hoarded?
    @hoarded
  end

  def hoard
    @hoarded = true
  end
end
