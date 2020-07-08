require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  #Iteration2
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal "King Soopers", cart.name
  end

  def test_it_has_a_capacity
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal 30, cart.capacity
  end

  def test_it_should_have_no_products_by_default
    cart = ShoppingCart.new("King Soopers", "30items")
    assert_equal [], cart.products
  end

  def test_it_should_be_able_to_add_products
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(toilet_paper)

    assert_equal [toilet_paper], cart.products

    cart.add_product(chicken)

    assert_equal [toilet_paper, chicken], cart.products
  end
end
