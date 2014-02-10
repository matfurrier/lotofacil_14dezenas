require "spec_helper"

require "lottery"

describe Lottery do 
	context "when the lottery adds the previous result" do
		before do 
			@loto = Lottery.new
			@loto.add_previous_result(1,2,3,5,6,7,8,13,15,16,17,18,20,21,23)
		end
		it "is possible add previous lottery result" do 				
			expect(@loto.previous_results.last.size).to eq(15)
		end
		context "when the lottery adds the two previous result" do
			before do
				@loto.add_previous_result(1,2,3,5,6,11,12,14,15,16,19,20,21,23,25)
			end			
			it "is possible add two previous lottery's results" do 				
				expect(@loto.previous_results.size).to eq(2)
			end
			it "is possible find dozens repeated in two previous results" do
				expect(@loto.find_repeated_dozens.size).to eq(10)
			end
			context "when generate fixed dozens" do
				before do
					@loto.generate_fixed_dozens	
				end
				it "its possible generate fixed dozens" do
					expect(@loto.fixed_dozens.size).to eq(14)
				end
				it "its possible generate remaining dozens" do 
					@loto.generate_remainding_dozens
					expect(@loto.remainding_dozens.size).to eq(11)
				end
			end
		end
	end
end