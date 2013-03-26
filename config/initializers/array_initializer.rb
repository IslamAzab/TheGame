class Array
	def avg
		return nil if self.size.zero?
		self.sum.to_f / self.size
	end

	alias_method :average, :avg
end 