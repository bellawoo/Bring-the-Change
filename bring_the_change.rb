require 'pry'
require 'minitest/autorun'

# #Normal Mode
# Write a Register class with a change function that takes an amount of money and returns the number of quarters, dimes, nickels and pennies needed to produce that amount:
# r = Register.new r.change 0.99 # => [3, 2, 0, 4]

class Register
	def quarters
		@quarters = 0.25
	end

	def dimes
		@dimes = 0.10
	end

	def nickels
		@nickels = 0.05
	end

	def pennies
		@pennies = 0.01
	end

	def change amount
		@amount = amount
		return nil if @amount < 0
	end
end


# Hard Mode
# Option 1 - OO: * Write a set of tests to verify that your register works (preferably before writing the register) * Initialize the register with a fixed number of each coin. Note as the coins are distributed, and e.g. use 2 nickels when you run out of dimes. What should happen when you can't make change at all? Write specs for it and then implement it.
class ChangeTest < MiniTest::Test
	def test_almost_a_dollar
		r = Register.new
		expected = r.change 0.99
		assert_equal expected, [3,2,0,4]
	end
end


# Option 2 - Enumerable:
# Allow for the addition / removal of coins e.g. we phase out the penny but add a 33¢ piece.
