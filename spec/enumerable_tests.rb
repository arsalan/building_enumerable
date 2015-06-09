require 'sorted_list'

describe "FakeEnumerable::SortedList" do
  before do
    @list = FakeEnumerable::SortedList.new

    # will get stored interally as 3,4,7,13,42
    @list << 3 << 13 << 42 << 4 << 7
  end

  it "map without block returns original" do
    mapped = @list.map
    expect(mapped).to eql @list
  end

  it "supports map" do
    expect(@list.map { |x| x + 1 }).to eql [4,5,8,14,43]
  end
end