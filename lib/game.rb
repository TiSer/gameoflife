require 'io/console'
require_relative 'display'

class Game
  def self.start!(iterations, field, life)
    iterations.to_i.times do |i|
      Display.show(field)
      life.step!
      sleep 0.1
      Rules.anybody_alive?(field.grid)
    end
  end

  module Rules
    ALIVE = [2,3]
    NEW_ONE = [3]

    def self.anybody_alive?(grid)
      unless grid.flatten.include?(1)
        puts "GAME OVER: all cells died. Press any key."
        get_out!
      end
    end

    def self.everything_stable?(current_grid, new_grid)
      if current_grid == new_grid
        puts "GAME OVER: everything stable. Press any key."
        get_out!
      end
    end

    def self.get_out!
      STDIN.getch
      exit
    end
  end

  module Settings
    COLS = 25
    ROWS = 25
    HOW_MANY = 100
  end

end
