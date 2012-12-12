class Fixnum

	def wirth
		candidates = wirth_candidates
		disallowed_strings.each do |string|
			candidates.delete_if { |e| e.include?(string) }
		end
		return candidates
	end

	def disallowed_strings
		((1..self/2).to_a.map { |n| n.wirth }).flatten.map { |string| string + string }
	end

 	def wirth_candidates
		alphabet = ['A', 'B', 'C']
		return alphabet if self == 1
		(self - 1).wirth_candidates.product(alphabet).map { |candidate, suffix| candidate + suffix }
	end

end
