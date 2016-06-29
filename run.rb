['field', 'life', 'text_parser', 'game'].each do |filename|
  require File.expand_path "../lib/#{filename}.rb", __FILE__
end

cols, rows, how_many = Game::Settings::COLS, Game::Settings::ROWS, Game::Settings::HOW_MANY

field = Field.new(cols, rows)
life = Life.new(field)
file_contents = File.new("inp.txt", "r").read
grid_coordinates = TextParser.parse(file_contents)
field.fill_in(grid_coordinates)

Game.start!(how_many, field, life)
puts "Iterations run out."
