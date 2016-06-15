require 'field'
require 'life'
require 'display'
require 'text_parser'
require 'rules'

namespace :game do

  desc "Arguments: rows, cols, how many iterations to continue]"
  task :run, [:cols, :rows, :how_many] => :environment do |t, args|
    args.with_defaults(cols: 30, rows: 30, how_many: 15)

    field = Field.new(args[:cols], args[:rows])
    life = Life.new(field)
    file_contents = File.new("public/inp.txt", "r").read
    grid_coordinates = TextParser.parse(file_contents)
    field.fill_in(grid_coordinates)

    args[:how_many].to_i.times do |i|
      Display.show(field)
      life.step!
      sleep 0.1
      Rules.anybody_alive?(field.grid)
    end
  end

end
