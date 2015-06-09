require 'sorted_list'

describe "FakeEnumerable::SortedList" do

  before do
    @list = FakeEnumerable::SortedList.new

    # will get stored interally as 3,4,7,13,42
    @list << 3 << 13 << 42 << 4 << 7
  end

  it "supports map" do
    expect(@list.map { |x| x + 1 }).to eql [4,5,8,14,43]
  end

  it "supports sort_by" do
    # ascii sort order
    expect(@list.sort_by { |x| x.to_s }).to eql([13, 3, 4, 42, 7])
  end

  it "supports select" do
    expect(@list.select { |x| x.even? }).to eql([4,42])
  end

  it "supports reduce" do
    expect(@list.reduce(:+)).to eql(69)
    expect(@list.reduce { |s,e| s + e }).to eql(69)
    expect(@list.reduce(-10) { |s,e| s + e }).to eql(59)
  end

end