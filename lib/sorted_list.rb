module FakeEnumerable
	class SortedList
		attr_accessor :list

		def initialize
			@list = []
		end

		def <<(item)
			@list.push item
			@list.sort!
		end

		def map
			return self unless block_given?

			mapped = SortedList.new
			@list.each do |member|
				mapped << yield(member)
			end

			mapped.list
		end
	end
end