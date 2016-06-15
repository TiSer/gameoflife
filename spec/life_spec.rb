require 'spec_helper'
require 'life'
require 'rules'
require 'field'

describe Life do

  field = Field.new(5,5)
  subject(:life) { Life.new(field) }
  before { field.fill_in([[[1,2], [1,3], [1,4], [1,4], [2,3]]]) } 

  describe '#lives_counter' do
    # [0, 0, 0, 0, 0]
    # [0, 0, 1, 1, 1]
    # [0, 0, 0, 1, 0]
    # [0, 0, 0, 0, 0]
    # [0, 0, 0, 0, 0]

    it 'should return 2 for 0,4' do
      expect(life.lives_counter(0, 4)).to be == 2
    end

    it 'should return 3 for 2,3' do
      expect(life.lives_counter(2, 3)).to be == 3
    end

    it 'should return zero for 3,1' do
      expect(life.lives_counter(3,1)).to be_zero
    end
  end

  describe '#step!' do
    it 'should change cells to new state' do
      before_step = [[0,0,0,0,0],[0,0,1,1,1],[0,0,0,1,0],[0,0,0,0,0],[0,0,0,0,0]]
      after_step =  [[0,0,0,1,0],[0,0,1,1,1],[0,0,1,1,1],[0,0,0,0,0],[0,0,0,0,0]] 
      expect{life.step!}.to change{field.grid}.from(before_step).to(after_step)
    end
  end

end