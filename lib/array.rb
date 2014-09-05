class Array

	def iterative_inject(arg1 = nil, arg2 = nil)
		arg1.class == Symbol ? (symbol = arg1; start = nil) : (symbol = arg2; start = arg1)
		memo = start || self[0]
		n = start.nil? ? 1 : 0
		block_given? ? self.drop(n).each { |element| memo = yield(memo, element) } : self.drop(n).each { |element| memo = memo.method(symbol).call(element) }
		memo
	end

	def recursive_inject(arg1 = self.shift, arg2 = nil, &block)
		arg1.class == Symbol ? (symbol = arg1; memo = self.shift) : (symbol = arg2; memo = arg1)
		copy = self.dup
		self.unshift(memo)
		block_given? ? memo = yield(memo, copy.shift) :			memo = memo.method(symbol).call(copy.shift)
		return memo if copy.empty?
		copy.recursive_inject(memo, symbol, &block)
	end

end