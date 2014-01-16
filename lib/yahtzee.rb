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
					sum += i if @dice.count(i) == 2
				end
			when :three
				@dice.each do |i|
					sum += i if @dice.count(i) == 3
				end
			when :four
				@dice.each do |i|
					sum += i if @dice.count(i) == 4
				end
			when :small_straight
				@dice.each do |i|
					sum += i if @dice.sort == [1,2,3,4,5]
				end
			when :large_straight
				@dice.each do |i|
					sum += i if @dice.sort == [2,3,4,5,6]
				end
		end
		sum
	end
end