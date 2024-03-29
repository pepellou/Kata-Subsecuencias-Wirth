# encoding: utf-8
require 'rspec'

require_relative '../wirth'

describe 'wirth' do

	@n_cases = [1, 2, 3, 4, 5, 6]

	it "returns a non empty array" do
		1.wirth.length.should_not == 0
	end

	it "returns only strings with A, B and C" do
		1.wirth.each do |string|
			string.each_char do |char|
				"ABC".should include(char)
			end
		end
	end

	@n_cases.each do |n|

		it "returns string with length N" do
			n.wirth.each do |string|
				string.length.should == n
			end
		end

		it "returns strings that contain no AA, BB or CC" do
			n.wirth.each do |string|
				string.should_not include "AA"
				string.should_not include "BB"
				string.should_not include "CC"
			end
		end

		it "returns strins with no ABAB nor ABCABC nor similar" do
			n.wirth.each do |string|
				string.should_not include "ABAB"
				string.should_not include "ABCABC"
				string.should_not include "BCBC"
				string.should_not include "BCABCA"
				string.should_not include "ACAC"
				string.should_not include "ACBACB"
				string.should_not include "BABA"
				string.should_not include "BACBAC"
				string.should_not include "CBCB"
				string.should_not include "CBACBA"
				string.should_not include "CACA"
				string.should_not include "CABCAB"
			end
		end

		it "returns as much results as we can" do
			known_results_for = {
				1 => 3,
				2 => 6,
				3 => 12,
				4 => 18,
				5 => 30,
				6 => 42
			}
			n.wirth.length.should >= known_results_for[n]
		end

		it "doesn't return more results than it can" do
			max_results_for = {
				1 => 3,
				2 => 9,
				3 => 27,
				4 => 81,
				5 => 243,
				6 => 729
			}
			n.wirth.length.should <= max_results_for[n]
		end

	end

end

describe 'Acceptance Test' do

	it "solves N=1" do
		1.wirth.should eql [ 'A', 'B', 'C' ]
	end

	it "solves N=2" do
		2.wirth.should eql [ 'AB', 'AC', 'BA', 'BC', 'CA', 'CB' ]
	end

	it "solves N=3" do
		3.wirth.should eql [ 
			'ABA', 'ABC', 'ACA', 'ACB', 'BAB', 'BAC', 
			'BCA', 'BCB', 'CAB', 'CAC', 'CBA', 'CBC' 
		]
	end

	it "solves N=4" do
		4.wirth.should eql [
			'ABAC', 'ABCA', 'ABCB', 'ACAB', 'ACBA', 'ACBC', 
			'BABC', 'BACA', 'BACB', 'BCAB', 'BCAC', 'BCBA', 
			'CABA', 'CABC', 'CACB', 'CBAB', 'CBAC', 'CBCA'	
		]
	end

	it "solves N=5" do
		5.wirth.should eql [
			'ABACA', 'ABACB', 'ABCAB', 'ABCAC', 'ABCBA', 'ACABA', 
			'ACABC', 'ACBAB', 'ACBAC', 'ACBCA', 'BABCA', 'BABCB', 
			'BACAB', 'BACBA', 'BACBC', 'BCABA', 'BCABC', 'BCACB',
			'BCBAB', 'BCBAC', 'CABAC', 'CABCA', 'CABCB', 'CACBA', 
			'CACBC', 'CBABC', 'CBACA', 'CBACB', 'CBCAB', 'CBCAC'
		]
	end

	it "solves N=6" do
		6.wirth.should eql [
			'ABACAB', 'ABACBA', 'ABACBC', 'ABCABA', 'ABCACB', 'ABCBAB', 
			'ABCBAC', 'ACABAC', 'ACABCA', 'ACABCB', 'ACBABC', 'ACBACA', 
			'ACBCAB', 'ACBCAC', 'BABCAB', 'BABCAC', 'BABCBA', 'BACABA', 
			'BACABC', 'BACBAB', 'BACBCA', 'BCABAC', 'BCABCB', 'BCACBA',
			'BCACBC', 'BCBABC', 'BCBACA', 'BCBACB', 'CABACA', 'CABACB', 
			'CABCAC', 'CABCBA', 'CACBAB', 'CACBAC', 'CACBCA', 'CBABCA', 
			'CBABCB', 'CBACAB', 'CBACBC', 'CBCABA', 'CBCABC', 'CBCACB'
		]
	end

	it "returns exactly expected number of results for N <= 15" do
		known_results_for = {
			1 => 3,
			2 => 6,
			3 => 12,
			4 => 18,
			5 => 30,
			6 => 42,
			7 => 60,
			8 => 78,
			9 => 108,
			10 => 144,
			11 => 204,
			12 => 264,
			13 => 342,
			14 => 456,
			15 => 618
		}
		known_results_for.each do |n, num_results|
			n.wirth.length.should == num_results
		end
	end

end
