require 'pry'
require 'minitest/autorun'

# #Normal Mode
# Write a Register class with a change function that takes an amount of money and returns the number of quarters, dimes, nickels and pennies needed to produce that amount:
# r = Register.new r.change 0.99 # => [3, 2, 0, 4]

class Register
	def initialize
		@quarter = 25
		@dime = 10
		@nickel = 5
		@penny = 1
	end

	def change_one_coin total, denom
		count = (total/denom).round
		leftover = (total % denom).round
		return [count, leftover]
	end

	def change amount
		amount = (amount * 100).to_i

		q_result = change_one_coin(amount, @quarter)
		q_number = q_result[0]
		q_leftover = q_result[1]
		# q_number, leftover = change_one_coin(amount, @quarter)

		d_result = change_one_coin(q_leftover, @dime)
		d_number = d_result[0]
		d_leftover = d_result[1]
		# d_number, leftover = change_one_coin(amount, @dime)

		n_result = change_one_coin(d_leftover, @nickel)
		n_number = n_result[0]
		n_leftover = n_result[1]
		# n_number, leftover = change_one_coin(amount, @nickel)

		p_result = change_one_coin(n_leftover, @penny)
		p_number = p_result[0]
		# p_number, leftover = change_one_coin(leftover, @penny)

		return [q_number,d_number,n_number,p_number]
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
