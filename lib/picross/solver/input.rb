module Picross
  module Solver
    class Input

      def initialize(filename)
        @filename = filename
      end

      attr_reader :length, :width, :rows, :columns, :board

      def read
        @length = 0
        @width = 0
        @rows = []
        @columns = []
        File.readlines(@filename).each_with_index do |line, index|
          data = line.split(",").map(&:to_i)
          if index == 0
            @length = data[0]
            @width = data[1]
          elsif index <= @length
            @rows << data
          else
            @columns << data
          end
        end
        @board = Array.new(@length, Array.new(@width, "."))
      end

      def print
        # puts "entire board: #{board}"
        puts "     _#{"_" * width * 2}"
        @board.each_with_index do |row, index|
          puts "#{@rows[index].join(",")} |#{row.join("|")}|"
          # puts "column: #{column}"
        end
        puts "     -#{"-" * width * 2}"
      end
    end
  end
end
