require 'test_helper'
class PtempleTest < ActiveSupport::TestCase
    
 def setup
	@customer = Customer.create(customername: "bubun", email: "bubun@example.com")
	@ptemple = @customer.ptemples.build(name: "some temple", summary: "this is the best temple ever", 
		description: "go straight, take right turn, southeast of seabeach")
 end


test "ptemple should be valid" do
  assert @ptemple.valid?	
end

test "customer_id should be present" do
 @ptemple.customer_id = nil
 assert_not @ptemple.valid?
end

test "name should be present" do
@ptemple.name = " "
assert_not @ptemple.valid?
end

test "name length should not be too long" do 
@ptemple.name = "a" * 101
assert_not @ptemple.valid?
end

test "name length should not be too short" do 
@ptemple.name = "aaaa"
assert_not @ptemple.valid?
end

test "summary should be present" do 
@ptemple.summary = " "
assert_not @ptemple.valid?
end

test "summary length should not be too long" do 
@ptemple.summary = "a" * 151
assert_not @ptemple.valid?
end

test "summary length should not be too short" do 
@ptemple.summary = "a" * 9
assert_not @ptemple.valid?
end

test "description should be present" do 
@ptemple.description = " "
assert_not @ptemple.valid?
end

test "description length should not be too long" do 
@ptemple.description = "a" * 501
assert_not @ptemple.valid?
end

test "description length should not be too short" do 
@ptemple.description = "a" * 19
assert_not @ptemple.valid?
end

end