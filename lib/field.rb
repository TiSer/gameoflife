class Field

  attr_accessor :cols, :rows, :grid

  def initialize(cols, rows)
    @cols, @rows = cols.to_i, rows.to_i
    @grid = make_grid
  end

  def fill_in(coordinates)
    coordinates.each {|row| fill(*row) }
  end

  def to_s
    @grid.inject('') do |s, rows|
      rows.each {|cell| s << cell.to_s}
      s << "\n"
    end
  end

  def make_grid
    Array.new(rows) { Array.new(cols, 0) }
  end


  private
    def fill(*cells)
      cells.each {|y,x| grid[y][x] = 1}
    end

end
