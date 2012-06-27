class GettingTo100 
	def displayEquation(equation)
		res = []
		if isFormulaResult100(equation)
			res << "************************"
			res << equation
			res << "************************"
		else
			res << equation
		end
	end

	def allFormulas
		digits = "123456789"
		oper = [[" + ", " - ", " - "],
				  [" - ", " + ", " - "],
				  [" - ", " - ", " + "]]
		operNum = oper[0].length;

		res = []
		1.upto(digits.length - operNum) do |i|
		(i+1).upto(digits.length - (operNum-1)) do |j|
		(j+1).upto(digits.length - (operNum-2)) do |k|
			parts = []
			parts << digits.slice(0...i)
			parts << digits.slice(i...j)
			parts << digits.slice(j...k)
			parts << digits.slice(k..-1)
			oper.each do |o|
				res << "#{parts[0]}#{o[0]}#{parts[1]}#{o[1]}#{parts[2]}#{o[2]}#{parts[3]}"
			end
		end
		end 
		end
		res
	end

	def allEquations
		formulas = allFormulas
		res = formulas.collect do |formula|
			displayEquation(formula + " = " + formulaResult(formula).to_s)
		end
		res.flatten
	end

	def formulaResult (formula)
		params = getParams(formula)
		operator = 1
		params.inject(0) do
			|res, param|
			if param.to_s == "+" 
				operator = 1
			elsif param.to_s == "-" 
				operator = -1
			else 
				res += param.to_i * operator
			end
			res
		end
	end	

private
	def isFormulaResult100(formula)
		formula.match(%r{\d+\s[+,-]\s\d+\s[+,-]\s\d+\s[+,-]\s\d+\s=\s100}) != nil
	end

	def getParams(equation)
		params = equation.match(%r{(\d+)\s([+,-])\s(\d+)\s([+,-])\s(\d+)\s([+,-])\s(\d+)}).to_a
		params.shift
		params
	end
end
