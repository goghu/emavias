require 'test_helper'

class AlmaceneTest < ActiveSupport::TestCase
  test "should not save Almacen without" do
  	almacen = Almacene.new
  	assert_not almacen.save
  end
end
