class Fixnum

	@@cache_strings = Hash.new
	@@cache_candidates = Hash.new
	@@cache_disallowed = Hash.new

	def wirth
		return @@cache_strings[self] if @@cache_strings.has_key?(self)
		candidates = wirth_candidates
		disallowed_strings.each do |string|
			candidates.delete_if { |e| e.include?(string) }
		end
		@@cache_strings[self] = candidates
		candidates
	end

	def disallowed_strings
		return @@cache_disallowed[self] if @@cache_disallowed.has_key?(self)
		result = ((1..self/2).to_a.map { |n| n.wirth }).flatten.map { |string| string + string }
		@@cache_disallowed[self] = result
		result
	end

 	def wirth_candidates
		return @@cache_candidates[self] if @@cache_candidates.has_key?(self)
		alphabet = ['A', 'B', 'C']
		return alphabet if self == 1
		result = (self - 1).wirth_candidates.product(alphabet).map { |candidate, suffix| candidate + suffix }
		@@cache_candidates[self] = result
		result
	end

end
