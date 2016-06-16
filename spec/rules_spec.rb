require 'spec_helper'
require 'life'
require 'game'
require 'field'
require 'text_parser'

describe Game::Rules do
  let(:field) { Field.new(5,5)  }
  let(:life)  { Life.new(field) }

  before do
    expect(Display).to receive(:show).at_least(:once)
    expect(STDIN).to receive(:getch).once
  end

  describe '#anybody_alive?' do
    before do
      file_contents = File.new("spec/support/dying.txt", "r").read
      grid_coordinates = TextParser.parse(file_contents)
      field.fill_in(grid_coordinates)
    end
   
    context 'when all cells will die' do 
      it 'should stop game' do
        expect(subject).to receive(:puts).with("GAME OVER: all cells died. Press any key.").once
        expect{Game.start!(10, field, life)}.to raise_error(SystemExit)
      end
    end
  end

  describe '#everything_stable?' do
    before do
      file_contents = File.new("spec/support/stable.txt", "r").read
      grid_coordinates = TextParser.parse(file_contents)
      field.fill_in(grid_coordinates)
    end
   
    context 'when all cells will stay alive and become stable' do 
      it 'should stop game' do
        expect(subject).to receive(:puts).with("GAME OVER: everything stable. Press any key.").once
        expect{Game.start!(10, field, life)}.to raise_error(SystemExit)
      end
    end
  end

end
