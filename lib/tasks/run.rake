require 'field'
require 'life'
require 'display'

namespace :game do

  desc "Arguments: rows, cols, how many iterations to continue]"
  task :run, [:cols, :rows, :how_many] => :environment do |t, args|
    args.with_defaults(cols: 30, rows: 30, how_many: 15)

    file = File.new("public/inp.txt", "r")
    contents = file.read
    grid_coordinates = []

    contents.split("\n").each do |line|
      row = []
      line.split("; ").each do |pair|
        row << pair.split(',').map(&:to_i)
      end

      grid_coordinates << row
    end

    field = Field.new(args[:cols], args[:rows])
    life = Life.new(field)
    grid_coordinates.each {|row| field.fill(*row) }

    args[:how_many].to_i.times do |i|
      Display.show(field)
      life.step!
      sleep 0.1
      raise "Game over: all cells died" if field.grid.flatten.exclude?(1)
    end
  end

end
