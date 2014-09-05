class Array

	def iterative_inject(arg1 = nil, arg2 = nil)
		arg1.class == Symbol ? (symbol = arg1; start = nil) : (symbol = arg2; start = arg1)
		memo = start || self[0]
		n = start.nil? ? 1 : 0
		if !block_given?
			self.drop(n).each { |element| memo = memo.method(symbol).call(element) }
		else
			self.drop(n).each { |element| memo = yield(memo, element) }
		end
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