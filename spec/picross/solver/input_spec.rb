RSpec.describe Picross::Solver::Input do
  let(:obj) { described_class.new("#{File.expand_path(".")}/spec/support/input/test.csv") }

  before { obj.read }

  it "reads length" do
    expect(obj.length).to equal 5
  end

  it "reads width" do
    expect(obj.width).to equal 5
  end

  it "reads rows" do
    expect(obj.rows).to match_array [[1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3]]
  end

  it "reads columns" do
    expect(obj.columns).to match_array [[1, 2, 4], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3]]
  end

  it "creates a board" do
    expect(obj.board).to match_array Array.new(5, Array.new(5, "."))
  end
end