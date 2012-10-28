class RomanNumeral	

	def initialize
		@a2r = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 40 => "XL", 10 =>"X", 9 => "IX", 5 => "V", 4 => "IV", 1 =>"I"}
		@r2a = {}
		@a2r.each_pair do |key, value|
			@r2a[value] = key
		end
	end

	def opposite_format(num)
		is_roman(num) ? to_arabic(num) : to_roman(num)
	end

	def to_arabic(num)
		return 0 if num.length == 0
		if num.length >= 2
			return @r2a[num[0..1]] + to_arabic(num[2..-1]) if @r2a.has_key?(num[0..1])
		end
		@r2a[num[0..0]] + to_arabic(num[1..-1])
	end

	def to_roman(numstr)
		num = numstr.to_i
		return "" if num == 0
		return @a2r[num] if @a2r.has_key?(num)
		@a2r.each_pair do |key, value|
			return value + to_roman(num-key) if num >= key
		end
	end

	def is_roman(num)
		num.to_s.gsub(/\d+/, "") == num
	end
end