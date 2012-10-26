require_relative "spec_helper"

class String
	def eliminate_space
		gsub(/\s+/, "")
	end
end

describe CreditCard do
	it "4408 0412 3456 7893 is validate" do
		CreditCard.new("4408 0412 3456 7893".eliminate_space).validate?.should be_true
	end

	it "1108 0412 3456 7893 is not validate because of the unknown credit card type" do
		CreditCard.new("1108 0412 3456 7893".eliminate_space).validate?.should be_false
	end

	it "4417 1234 5678 9112 is not validate because the sum is not divisble by 10" do
		CreditCard.new("4417 1234 5678 9112".eliminate_space).validate?.should be_false
	end
end