require 'spec_helper'
require_relative '../lib/yahtzee'

describe YahtzeeRoll do
	describe "#initialize" do
		it "should have five args" do
			expect{ YahtzeeRoll.new(1, 4, 2, 3, 7) }.to raise_error 'invalid number of dices'
		end
	end
end