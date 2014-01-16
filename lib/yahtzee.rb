class YahtzeeRoll
	attr_accessor :dice1, :dice2, :dice3, :dice4, :dice5


	def initialize(*dice)
		raise 'invalid number of dice' if dice.length != 5
		dice.each do |d|
			raise 'invalid value of dice' if (1..6).include?(d)
		end
		@dice1 = dice[0]
		@dice2 = dice[1]
		@dice3 = dice[2]
		@dice4 = dice[3]
		@dice5 = dice[4]
	end
end