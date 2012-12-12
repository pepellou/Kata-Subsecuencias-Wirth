class Fixnum

	@@hash_wirth_strings = Hash.new
	@@hash_wirth_candidates = Hash.new
	@@hash_disallowed_strings = Hash.new

	def wirth
		return @@hash_wirth_strings[self] if @@hash_wirth_strings.has_key?(self)
		candidates = wirth_candidates
		disallowed_strings.each do |string|
			candidates.delete_if { |e| e.include?(string) }
		end
		@@hash_wirth_strings[self] = candidates
		return candidates
	end

	def disallowed_strings
		return @@hash_disallowed_strings[self] if @@hash_disallowed_strings.has_key?(self)
		result = ((1..self/2).to_a.map { |n| n.wirth }).flatten.map { |string| string + string }
		@@hash_disallowed_strings[self] = result
		return result
	end

 	def wirth_candidates
		return @@hash_wirth_candidates[self] if @@hash_wirth_candidates.has_key?(self)
		alphabet = ['A', 'B', 'C']
		return alphabet if self == 1
		result = (self - 1).wirth_candidates.product(alphabet).map { |candidate, suffix| candidate + suffix }
		@@hash_wirth_candidates[self] = result
		return result
	end

end
