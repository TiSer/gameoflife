module TextParser
  def self.parse(contents)
  	grid_coordinates = []

  	contents.split("\n").each do |line|
      row = []
      line.split("; ").each do |pair|
        row << pair.split(',').map(&:to_i)
      end

      grid_coordinates << row
    end

    grid_coordinates
  end
end