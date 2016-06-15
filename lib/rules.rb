module Rules
  ALIVE = [2,3]
  NEW_ONE = [3]

  def self.anybody_alive?(grid)
  	raise "Game over: all cells died" if grid.flatten.exclude?(1)
  end

  def self.everything_stable?(current_grid, new_grid)
  	raise "Game over: everything stable" if current_grid == new_grid
  end
end
