 require 'array'

 describe Array do

 	let(:array) { [1, 2, 3, 4, 5] }

 	context "inject method" do

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

 		it "can sum an array of numbers" do
	 		expect(array.iterative_inject { |sum, x| sum + x + x }).to eq (array.inject { |sum, x| sum + x + x })
	 	end

	 	it "uses the first element as the default initial value" do
	 		expect(array.iterative_inject { |sum, x| sum + x }).to eq (array.inject { |sum, x| sum + x })
	 	end

	 	it "can take an initial value" do
	 		expect(array.iterative_inject(1) { |sum, x| sum + x }).to eq(array.inject(1) { |sum, x| sum + x })
	 	end

		it "leaves the original array intact" do
			array.iterative_inject { |sum, x| sum + x }
			expect(array).to eq [1, 2, 3, 4, 5]
		end

	 	it "can be used to join an array of strings" do
			array = ["This", "is", "a", "sentence"]
			expect(array.iterative_inject { |sentence, word| sentence << " " unless sentence.empty?; sentence << word }).to eq "This is a sentence"
		end

		it "takes a symbol for adding" do
			expect(array.iterative_inject(:+)).to eq(array.inject(:+))
		end

		it "takes a symbol for multiplying" do
			expect(array.iterative_inject(:*)).to eq(array.inject(:*))
		end

		it "takes a symbol for adding and a starting value" do
			expect(array.iterative_inject(2, :+)).to eq(array.inject(2, :+))
		end

 	end

 	context "recursive inject" do

 		it "can sum an array of numbers" do
	 		expect(array.recursive_inject { |sum, x| sum + x }).to eq(array.inject { |sum, x| sum + x })
	 	end

	 	it "uses the first element as the default initial value" do
	 		expect(array.recursive_inject { |sum, x| sum + x }).to eq(array.inject { |sum, x| sum + x })
	 	end

	 	it "can take an initial value" do
	 		expect(array.recursive_inject(1) { |sum, x| sum + x }).to eq(array.inject(1) { |sum, x| sum + x })
	 	end

	 	it "leaves the original array intact" do
			array.recursive_inject { |sum, x| sum + x }
			expect(array).to eq [1, 2, 3, 4, 5]
		end

		it "can be used to join an array of strings" do
			array = ["This", "is", "a", "sentence"]
			expect(array.iterative_inject { |sentence, word| sentence << " " unless sentence.empty?; sentence << word }).to eq "This is a sentence"
		end

	 	it "takes a symbol for adding" do
			expect(array.recursive_inject(:+)).to eq (array.inject(:+))
		end

		it "takes a symbol for multiplying" do
			expect(array.iterative_inject(:*)).to eq(array.inject(:*))
		end

		it "takes a symbol for adding and a starting value" do
			expect(array.recursive_inject(2, :+)).to eq (array.inject(2, :+))
		end

 	end

 end