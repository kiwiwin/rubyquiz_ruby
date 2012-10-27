class CreditCard
	
	def initialize
		@cards = {}
	end

	def validate_number?(num)
		return false if validate_type(num) == "Unknown"
		validate_divisble_by_10(num)
	end

	def begin_with(card, &rule)
		@cards[card] = rule
	end

private
	def validate_type(num)
		@cards.each_pair do |card, rule|
			return true if rule.call(num)
		end
		"Unknown"
	end

	def validate_divisble_by_10(num)
		multiply_two = false
		sum = num.split(//).reverse.inject(0) do |sum, char|
			sum += sum_digit((char.to_i*(multiply_two ? 2:1)).to_s)
			multiply_two = !multiply_two
			sum
		end
		sum % 10 == 0
	end
	
	def sum_digit(number)
		number.each_char.inject(0) do |sum, char|
			sum += char.to_i
		end	
	end
end