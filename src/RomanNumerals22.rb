class RomanNumeral	

	def initialize
		@a2r = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 40 => "XL", 10 =>"X", 9 => "IX", 5 => "V", 4 => "IV", 1 =>"I"}
	end

	def opposite_format(num)
		is_roman(num) ? to_arabic(num) : to_roman(num)
	end

	def to_arabic(num)
		return 0 if num.length == 0
		@a2r.each_pair do |value, key|
			return value + to_arabic(num[key.length..-1]) if num.index(key) == 0
		end
	end

	def to_roman(num)
		return @a2r[num] if @a2r.has_key?(num)
		@a2r.each_pair do |key, value|
			return value + to_roman(num-key) if num >= key
		end
	end

	def is_roman(num)
		num.to_s.gsub(/\d+/, "") == num
	end
	
end