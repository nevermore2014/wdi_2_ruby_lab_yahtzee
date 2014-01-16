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

	describe '#scoring' do
		it 'Score the sum of the two highest matching dice when :pair' do
			one_pair = YahtzeeRoll.new(2,2,3,4,5)
			two_pair = YahtzeeRoll.new(2,2,5,5,1)
			expect(one_pair.scoring(:pair)).to eq 4
			expect(two_pair.scoring(:pair)).to eq 10
		end	
	end
end