class Life

  def initialize(field)
  	@field = field
  end

  def step!
    new_grid = @field.make_grid
    @field.grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        count = lives_counter(y,x)
        new_grid[y][x] = if cell.zero?
          Rules::NEW_ONE.include?(count) ? 1 : 0
        else
          Rules::ALIVE.include?(count) ? 1 : 0
        end
      end
    end

    Rules.everything_stable?(@field.grid, new_grid)
    @field.grid = new_grid
  end

  def lives_counter(y,x)
    neighbors(y,x).select {|cell| cell == 1}.size
  end

  private

    def neighbors(y, x)
      (-1..1).inject [] do |values, py|
        (-1..1).each do |px|
          unless py == 0 and px == 0
            i = y + py
            j = x + px
            i = 0 unless i < @field.rows
            j = 0 unless j < @field.cols
            values << @field.grid[i][j]
          end
        end
        values
      end
    end

end
