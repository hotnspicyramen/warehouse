require 'test_helper'

class WarehouseTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @product = @user.warehouses.build(name: "Some random warehouse",
    												description: "who cares dude",
    												address: "3140 South Michigan Avenue, Chicago, Illinois",
    											 	manager: "Obama",
                            manager_email: "obama@gmail.com"
                            manager_phone_number: 8004432312
    											 region: 1)
  end

  test "should be valid" do
    assert @warehouse.valid?
  end

  test "user id should be present" do
    @warehouse.user_id = nil
    assert_not @warehouse.valid?
  end
end