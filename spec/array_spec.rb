 require 'array'

 describe Array do

 	let(:array) { [1, 2, 3, 4, 5] }

 	context "inject method" do

	 	it "takes an array" do
	 		expect(array.respond_to?(:inject)).to eq true
	 	end

	 	it "iterates over each element of the array" do
	 		expect(array.inject { |sum, x| sum + x }).to eq (array[0]+array[1]+array[2]+array[3]+array[4])
	 	end

	 	it "uses the first element as the default initial value" do
	 		expect(array.inject { |sum, x| sum + x }).to eq 15
	 	end

	 	it "can take an initial value" do
	 		expect(array.inject(3) { |sum, x| sum + x }).to eq 18
	 	end

 	end

 	context "iterative inject" do

 		it "takes an array" do
	 		expect(array.respond_to?(:iterative_inject)).to eq true
	 	end

	 	it "iterates over each element of the array" do
	 		expect(array.iterative_inject { |sum, x| sum + x }).to eq (array[0]+array[1]+array[2]+array[3]+array[4])
	 	end

	 	it "uses the first element as the default initial value" do
	 		expect(array.iterative_inject { |sum, x| sum + x }).to eq 15
	 	end

	 	it "can take an initial value" do
	 		expect(array.iterative_inject(3) { |sum, x| sum + x }).to eq 18
	 	end

	 	it "can be used to multiply all the numbers in an array" do
	 		expect(array.iterative_inject { |product, x| product * x }).to eq 120
	 	end

	 	it "can be used to join an array of strings" do
			array = ["This", "is", "a", "sentence"]
			expect(array.iterative_inject { |sentence, word| sentence << " " unless sentence.empty?; sentence << word }).to eq "This is a sentence"
		end

		it "leaves the original array intact" do
			array.iterative_inject { |sum, x| sum + x }
			expect(array).to eq [1, 2, 3, 4, 5]
		end

		it 'takes a symbol for adding' do
			expect([1,2,3,4].iterative_inject(&:+)).to eq 10
		end

		it 'takes a symbol for adding and a starting point' do
			expect([1,2,3,4].iterative_inject(2, &:+)).to eq 12
		end

 	end

 	context "recursive inject" do

 		it "can sum an array of numbers" do
	 		expect(array.recursive_inject { |sum, x| sum + x }).to eq 15
	 	end

	 	it "can take an initial value" do
	 		expect(array.recursive_inject(3) { |sum, x| sum + x }).to eq 18
	 	end

	 	it "leaves the original array intact" do
			array.recursive_inject { |sum, x| sum + x }
			expect(array).to eq [1, 2, 3, 4, 5]
		end

 	end

 end