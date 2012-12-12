# encoding: utf-8
require 'rspec'

require_relative '../wirth'

describe 'cache' do

	it "returns expected result" do
		cache = Cache.new

		(cache.store(1) { 1 + 1 }).should == 2
		(cache.store(2) { 3 + 4 }).should == 7
	end

	it "doesn't duplicate computation" do
		cache = Cache.new
		count = 0

		(cache.store(1) do 
			count = count + 1
			1 + 1 
		end).should == 2
		(cache.store(1) do
			count = count + 1
			1 + 1 
		end).should == 2

		count.should == 1
	end

end
