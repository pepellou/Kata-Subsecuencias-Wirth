class Fixnum

	def wirth
		candidates = wirth_candidates
		disallowed_strings.each do |string|
			candidates.delete_if { |e| e.include?(string) }
		end
		return candidates
	end

	def disallowed_strings
		result = []
		(1..self/2).each do |n|
			n.wirth.each do |string|
				result.push(string + string)
			end
		end
		result
	end

 	def wirth_candidates
		alphabet = ['A', 'B', 'C']
		return alphabet if self == 1
		result = []
		(self - 1).wirth_candidates.each do |string|
			alphabet.each do |prefix|
				result.push(prefix + string)
			end
		end
		result
	end

end
