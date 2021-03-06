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
			expect(four.scoring(:four)).to eq 20
		end

		it 'returns the sum of 5 when straight is selected' do
			straight = YahtzeeRoll.new(1,2,3,4,5)
			expect(straight.scoring(:small_straight)).to eq 15
		end

		it 'returns the 20 for a large straight' do
			straight = YahtzeeRoll.new(2,3,4,5,6)
			expect(straight.scoring(:large_straight)).to eq 20
		end

		it 'returns score the sum of the dice for a full_house if one pair and three of a kind' do
			roll = YahtzeeRoll.new(2,2,3,3,3)
			expect(roll.scoring(:full_house)).to eq 13
		end

		it 'returns score the sum of the dice for a Yahtzee if one kind' do
			ya = YahtzeeRoll.new(2,2,2,2,2)
			expect(ya.scoring(:yahtzee)).to eq 50
		end


	end
end