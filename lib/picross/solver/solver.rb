module Picross
  module Solver
    class Solver

      def initialize(input)
        @input = input
      end

      attr_reader :input

      def solve
        # puts "start"
        # input.print
        input.board.each_with_index do |row, index|
          sum = input.rows[index].sum
          length = input.rows[index].length
          diff = length - 1
          if input.rows[index].sum == input.width
            input.board[index] = Array.new(input.width, "o")
          else
            if sum + diff == input.width
              # puts "row: #{input.rows[index]} sum: #{sum} diff #{diff}"
              _row = input.rows[index]
              arr = []
              _row.each_with_index do |item, index|
                arr << Array.new(item, "o")
                if index + 1 < _row.length
                  arr << ["x"]
                end
              end
              # puts "arr: #{arr} flatten: #{arr.flatten}"
              input.board[index] = arr.flatten

            end
          end
          # puts "end of iteration"
          # input.print
        end
        # puts "end"
        # input.print
      end
    end
  end
end
