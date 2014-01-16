require 'spec_helper'
require 'pry'
require_relative '../lib/yahtzee'

describe YahtzeeRoll do
	describe "#initialize" do
		it "should be valid roll of five dices" do
			expect{ YahtzeeRoll.new(1, 4, 2, 3) }.to raise_error 'invalid number of dice'
			expect{ YahtzeeRoll.new(7, 7, 7, 7, 7)}.to raise_error 'invalid value of dice'
		end
	end
end