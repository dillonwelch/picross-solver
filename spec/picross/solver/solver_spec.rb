RSpec.describe Picross::Solver::Solver do
  let(:input) { Picross::Solver::Input.new("#{File.expand_path(".")}/spec/support/input/test2.csv") }

  before do
    input.read
    described_class.new(input).solve
  end

  it "fills a row where the value directly matches the width" do
    expect(input.board[0]).to match_array(Array.new(5, "o"))
  end

  it "fills a row where the values of all 1's combined match the width" do
    expect(input.board[1]).to match_array(%w[o x o x o])
  end

  it "fills a row where the values of bigger numbers combined match the width" do
    expect(input.board[2]).to match_array(%w[o o x o o])
  end

  it "does not yet have other algorithms" do
    expect(input.board[3]).to match_array(Array.new(5, "."))
    expect(input.board[4]).to match_array(Array.new(5, "."))
  end
end
