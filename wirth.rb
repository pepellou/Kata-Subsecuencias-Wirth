class Cache

	attr_accessor :data

	def initialize
		@data = Hash.new
	end

	def store(key)
		return @data[key] if @data.has_key? key
		@data[key] = yield
		@data[key]
	end

end

class Fixnum

	@@cache_strings = Cache.new
	@@cache_candidates = Cache.new
	@@cache_disallowed = Cache.new

	def wirth
		@@cache_strings.store(self) do
			candidates = wirth_candidates
			disallowed_strings.each do |string|
				candidates.delete_if { |e| e.include?(string) }
			end
			candidates
		end
	end

	def disallowed_strings
		@@cache_disallowed.store(self) do
			((1..self/2).to_a.map { |n| n.wirth }).flatten.map { |string| string + string }
		end
	end

 	def wirth_candidates
		@@cache_candidates.store(self) do
			alphabet = ['A', 'B', 'C']
			return alphabet if self == 1
			(self - 1).wirth_candidates.product(alphabet).map { |candidate, suffix| candidate + suffix }
		end
	end

end
