require_relative "spec_helper"

class String
	def eliminate_space
		gsub(/\s+/, "")
	end
end

describe CreditCard do

	before(:all) do
		@card = CreditCard.new
		@card.begin_with(:Visa) { |num| num.length == 13 || num.length == 16 && num =~ /^4/ }
		@card.begin_with(:MasterCard) { |num| num.length == 16 && num =~ /^5[1-5]/ }
		@card.begin_with(:Discover) { |num| num.length == 16 && num =~ /^6011/ }
		@card.begin_with(:AMEX) { |num| num.length == 15 && num =~ /^(34|37)/ }
	end

	it "4408 0412 3456 7893 is validate" do
		@card.validate_number?("4408 0412 3456 7893".eliminate_space).should be_true
	end

	it "1108 0412 3456 7893 is not validate because of the unknown credit card type" do
		@card.validate_number?("1108 0412 3456 7893".eliminate_space).should be_false
	end

	it "4417 1234 5678 9112 is not validate because the sum is not divisble by 10" do
		@card.validate_number?("4417 1234 5678 9112".eliminate_space).should be_false
	end
end