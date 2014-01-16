class YahtzeeRoll
	attr_accessor :dice


	def initialize(*dice)
		raise 'invalid number of dice' if dice.length != 5
		dice.each do |d|
			raise 'invalid value of dice' unless (1..6).include?(d)
		end
		@dice = dice
		
	end

	def scoring(category)
		sum = 0
		case category
		when :pair
			@dice.each do |i|
				@dice.count(i) == 2 ? sum += i : sum += 0
			end
		end
		sum
	end
end