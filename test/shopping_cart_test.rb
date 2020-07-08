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

  def test_it_give_us_details_about_itself
    cart = ShoppingCart.new("King Soopers", "30items")
    expected_details = {name: "King Soopers", capacity: 30}

    assert_equal expected_details, cart.details
  end

  #Iteration3
  def test_it_can_give_us_the_total_number_of_products_its_carrying
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(toilet_paper)
    assert_equal 10, cart.total_number_of_products
    cart.add_product(chicken)
    assert_equal 12, cart.total_number_of_products
  end

  def test_it_knows_if_it_is_full_or_not
    cart = ShoppingCart.new("King Soopers", "30items")
    alot_of_toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '29')
    chicken = Product.new(:meat, 'chicken', 4.50, '1')

    cart.add_product(alot_of_toilet_paper)

    assert_equal false, cart.is_full?

    cart.add_product(chicken)

    assert_equal true, cart.is_full?
  end

  def test_it_can_return_products_filtered_by_a_given_category
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(toilet_paper)
    cart.add_product(chicken)

    assert_equal [toilet_paper], cart.products_by_category(:paper)
  end

  #Iteration3
  def test_it_can_tell_what_percentage_of_itself_is_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(toilet_paper)

    assert_equal 33.33, cart.percentage_occupied

    cart.add_product(chicken)

    assert_equal 40, cart.percentage_occupied
  end
end
