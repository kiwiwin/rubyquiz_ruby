require_relative 'spec_helper'

describe RomanNumeral do
	before(:all) do
		@roman = RomanNumeral.new
	end


	it "should return 1 for I" do
		@roman.opposite_format("I").should == 1
	end	

	it "should return corresponding Arabic number for signle roman numeral" do
		@roman.opposite_format("I").should == 1
		@roman.opposite_format("V").should == 5
		@roman.opposite_format("X").should == 10
		@roman.opposite_format("L").should == 50
		@roman.opposite_format("C").should == 100
		@roman.opposite_format("D").should == 500
		@roman.opposite_format("M").should == 1000
	end

	it "should return I for 1" do 
		@roman.opposite_format(1).should == "I"
	end

	it "should return corresponding single Roman Numeral for Arabic number" do
		@roman.opposite_format(1).should == "I"
		@roman.opposite_format(5).should == "V"
		@roman.opposite_format(10).should == "X"
		@roman.opposite_format(50).should == "L"
		@roman.opposite_format(100).should == "C"
		@roman.opposite_format(500).should == "D"
		@roman.opposite_format(1000).should == "M"
	end

	it "II == 2" do
		@roman.opposite_format(2).should == "II"
		@roman.opposite_format("II").should == 2
	end

	it "VIII == 8" do
		@roman.opposite_format(8).should == "VIII"
		@roman.opposite_format("VIII").should == 8
	end

	it "IV == 4" do
		@roman.opposite_format(4).should == "IV"
		@roman.opposite_format("IV").should == 4
	end

	it "should not return three consecutive roman numerals" do
		@roman.opposite_format(4).should == "IV"
		@roman.opposite_format(9).should == "IX"
		@roman.opposite_format(40).should == "XL"
		@roman.opposite_format(90).should == "XC"
		@roman.opposite_format(400).should == "CD"
		@roman.opposite_format(900).should == "CM"
	end

	it "should return CCXCI for 291" do
		@roman.opposite_format(291).should == "CCXCI"
	end
end