class Array

	def iterative_inject(start = nil)
		memo = start || self[0]
		n = start.nil? ? 1 : 0
		self.drop(n).each { |element| memo = yield(memo, element) }
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