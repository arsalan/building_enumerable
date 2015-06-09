
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
			mapped = FakeEnumerable::SortedList.new
			@list.each do |member|
				mapped << yield(member)
			end
			mapped.list
		end

		def sort_by
			map {|l| [yield(l), l]}.map {|l| l[1]}
		end

		def select
			selected = FakeEnumerable::SortedList.new
			@list.each do |member|
				if yield(member)
					selected << member 
				end
			end
			selected.list
		end

		def reduce(how = nil)
			reduced = how.is_a?(Fixnum) ? how : 0
			symbol = how if how.is_a?(Symbol)

			@list.each do |member|
				if block_given?
					reduced = yield(reduced, member)
				else
					reduced = reduced.send(symbol, member)
				end
			end
			reduced
		end

	end
end