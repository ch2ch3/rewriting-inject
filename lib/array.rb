class Array

	def iterative_inject(start = self[0])
		memo ||= start
		copy = self.dup
		copy.shift if memo == copy[0]
		copy.each { |element| memo = yield(memo, element) }
		memo
	end

	def recursive_inject(memo = self.shift, &block)
		copy = self.dup
		self.unshift(memo)
		memo = yield(memo, copy.shift)
		return memo if copy.empty?
		copy.recursive_inject(memo, &block)
	end

end