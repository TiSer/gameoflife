require 'field'
require 'life'
require 'text_parser'
require 'game'

namespace :game do

  desc "Arguments: [rows, cols, how many iterations to continue]"
  task :run, [:cols, :rows, :how_many] => :environment do |t, args|
    args.with_defaults(cols: 30, rows: 30, how_many: 15)

    field = Field.new(args[:cols], args[:rows])
    life = Life.new(field)
    file_contents = File.new("public/inp.txt", "r").read
    grid_coordinates = TextParser.parse(file_contents)
    field.fill_in(grid_coordinates)

    Game.start!(args[:how_many], field, life)
    puts "Iterations run out."
  end

end
