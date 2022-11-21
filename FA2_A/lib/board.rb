class Board

    attr_reader :size
    def initialize(size)
       @size = size 
       @grid = Array.new(size) { Array.new(size) }
    end

    def [](pos)
        i, j = pos
        @grid[i][j]
    end

    def []=(pos, mark)
        i, j = pos

        @grid[i][j] = mark
    end

    def complete_row?(mark)
       @grid.any? { |row| row.all?(mark) } 
    end

    def complete_col?(mark)
       @grid.transpose.any? { |row| row.all?(mark) } 
    end

    def complete_diag?(mark)
       num_of_rows = @grid.length 
       p, s = 0, 0

       (0...num_of_rows).each do |i|
         p += 1 if @grid[i][i] == mark
         s += 1 if @grid[i][num_of_rows - 1 - i] == mark
       end

       return p == num_of_rows || s === num_of_rows
    end

    def winner?(mark)
        return complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
