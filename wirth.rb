class Fixnum

	def wirth
		base_string = "ABCABA"
		(1..42).map { |x| base_string[0..self-1] }
	end

end
