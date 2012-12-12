class Fixnum

	def wirth
		candidates = wirth_candidates
		candidates.delete_if { |e| e.include?("AA") }
		candidates.delete_if { |e| e.include?("BB") }
		candidates.delete_if { |e| e.include?("CC") }
		candidates.delete_if { |e| e.include?("ABAB") }
		candidates.delete_if { |e| e.include?("BABA") }
		candidates.delete_if { |e| e.include?("BCBC") }
		candidates.delete_if { |e| e.include?("CBCB") }
		candidates.delete_if { |e| e.include?("ACAC") }
		candidates.delete_if { |e| e.include?("CACA") }
		candidates.delete_if { |e| e.include?("ABCABC") }
		candidates.delete_if { |e| e.include?("BCABCA") }
		candidates.delete_if { |e| e.include?("CBACBA") }
		candidates.delete_if { |e| e.include?("CABCAB") }
		candidates.delete_if { |e| e.include?("ACBACB") }
		candidates.delete_if { |e| e.include?("BACBAC") }
		return candidates
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
