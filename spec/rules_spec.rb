require 'spec_helper'
require 'life'
require 'game'
require 'field'
require 'text_parser'

describe Game::Rules do
  field = Field.new(5,5)
  life = Life.new(field)
  before {expect(Display).to receive(:show).at_least(:once)}
  before {expect(STDIN).to receive(:getch).once}

  describe '#anybody_alive?' do
    before do
      file_contents = File.new("public/dying.txt", "r").read
      grid_coordinates = TextParser.parse(file_contents)
      field.fill_in(grid_coordinates)
    end
   
    it 'should stop game if all cells are died' do
      expect(subject).to receive(:puts).with("GAME OVER: all cells died. Press any key.").once
      expect{Game.start!(10, field, life)}.to raise_error(SystemExit) #
    end
  end

  describe '#everything_stable?' do
    before do
      file_contents = File.new("public/stable.txt", "r").read
      grid_coordinates = TextParser.parse(file_contents)
      field.fill_in(grid_coordinates)
    end
   
    it 'should stop game if situation is stable' do
      expect(subject).to receive(:puts).with("GAME OVER: everything stable. Press any key.").once
      expect{Game.start!(10, field, life)}.to raise_error(SystemExit)
    end
  end

end