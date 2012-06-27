class GettingTo100 
	def initialize
		@digits = "123456789"
		@oper = [[" + ", " - ", " - "],
		  		   [" - ", " + ", " - "],
					[" - ", " - ", " + "]]
	end

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
		operNum = @oper[0].length;

		res = []
		1.upto(@digits.length - operNum) do |i|
		(i+1).upto(@digits.length - (operNum-1)) do |j|
		(j+1).upto(@digits.length - (operNum-2)) do |k|
			@oper.each do |o|
				res << makeEquation(i,j,k,o)
			end
		end
		end 
		end
		res
	end

	def makeEquation(i, j, k, o)
		"#{@digits.slice(0...i)}#{o[0]}#{@digits.slice(i...j)}#{o[1]}#{@digits.slice(j...k)}#{o[2]}#{@digits.slice(k..-1)}"
	end

	def allEquations
		formulas = allFormulas
		formulas.collect do |formula|
			formula + " = " + formulaResult(formula).to_s
		end
	end

	def displayAllEquations
		res = allEquations.collect do |equation|
			displayEquation(equation)
		end
		res.flatten
	end

	def formulaResult (formula)
		eval formula
	end	

private
	def isFormulaResult100(formula)
		formula.match(%r{\d+\s[+,-]\s\d+\s[+,-]\s\d+\s[+,-]\s\d+\s=\s100}) != nil
	end
end
