class CreditCard
	def initialize(num)
		@num = num
	end

	def validate?
		return false if validate_type == "Unknown"
		validate_divisble_by_10
	end

private
	def validate_type
		length = @num.size
		if length == 15 && @num =~ /^(34|37)/
			"AMEX"
		elsif length == 16 && @num =~ /^6011/
			"Discover"
		elsif length == 16 && @num =~ /^5[1-5]/
			"MasterCard"
		elsif (length == 13 || length == 16) && @num =~ /^4/
			"Visa"
		else
			"Unknown"
		end
	end

	def validate_divisble_by_10
		multiply_two = false
		sum = @num.split(//).reverse.inject(0) do |sum, char|
			if multiply_two
				sum += sum_digit((char.to_i*2).to_s)
			else
				sum += sum_digit((char.to_i).to_s)
			end
			multiply_two ^= true
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