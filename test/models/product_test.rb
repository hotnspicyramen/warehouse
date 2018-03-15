require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @product = @user.products.build(name: "Big Smoke",
    												description: "El grando smokio",
    												price: 4.20,
    											 	quantity: 420,
    											 region: 1)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "user id should be present" do
    @product.user_id = nil
    assert_not @product.valid?
  end
end
