class CreditCard
	
	def initialize(num)
		@num = num
		begin_with(:Visa) { |num| num.length == 13 || num.length == 16 && num =~ /^4/ }
		begin_with(:MasterCard) { |num| num.length == 16 && num =~ /^5[1-5]/ }
		begin_with(:Discover) { |num| num.length == 16 && num =~ /^6011/ }
		begin_with(:AMEX) { |num| num.length == 15 && num =~ /^(34|37)/ }
	end

	def validate?
		return false if validate_type == "Unknown"
		validate_divisble_by_10
	end

	def begin_with(card, &rule)
		@cards ||= {}
		@cards[card] = rule
	end

private
	def validate_type
		@cards.each_pair do |card, rule|
			return true if rule.call(@num)
		end
		"Unknown"
	end

	def validate_divisble_by_10
		multiply_two = false
		sum = @num.split(//).reverse.inject(0) do |sum, char|
			if multiply_two
				sum += sum_digit((char.to_i*2).to_s)
			else
				sum += sum_digit((char.to_i).to_s)
			end
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