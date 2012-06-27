require_relative "../../src/GettingTo100#119/GettingTo100"

describe GettingTo100 do
	before(:all) do
		@gettingTo100 = GettingTo100.new
	end

	it "display equation equal to 100 with stars" do
		#when
		equationEqualTo100 = "123 - 45 - 67 + 89 = 100"

		#expect
		expected = [ "************************",
						 equationEqualTo100,
						 "************************" ]

		#then
		@gettingTo100.displayEquation(equationEqualTo100).should == expected
	end

	it "display equation NOT equal to 100 as it is" do
		#when
		equationNotEqualTo100 = "12 - 34 - 567 + 89 = -500"

		#expect
		expected = [ equationNotEqualTo100 ]

		#then
		@gettingTo100.displayEquation(equationNotEqualTo100).should == expected
	end

	it "formula result" do
		#when
		formula = "12 - 34 - 567 + 89"
	
		#then
		@gettingTo100.formulaResult(formula).should == -500
	end

	it "should return 168 for all formulas" do
		@gettingTo100.allFormulas.size.should == 168
	end

	it "should return more than 168 elements for all equations" do
		@gettingTo100.displayAllEquations.size.should > 168
	end

end
