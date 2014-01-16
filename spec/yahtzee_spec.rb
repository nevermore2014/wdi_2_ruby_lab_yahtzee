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
			expect(two_pair.scoring(:pair)).to eq 14
		end

		it 'returns the sum of 3 when :three is selected' do
			three = YahtzeeRoll.new(2,2,5,5,5)
			expect(three.scoring(:three)).to eq 15
		end

		it 'returns the sum of 4 when :three is selected' do
			four = YahtzeeRoll.new(2,5,5,5,5)
			expect(three.scoring(:four)).to eq 20
		end

		it 'returns the sum of 5 when straight is selected' do
			straight = YahtzeeRoll.new(1,2,3,4,5)
			expect(three.scoring(:three)).to eq 15
		end

	

	end
end