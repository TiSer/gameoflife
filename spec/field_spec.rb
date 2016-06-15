require 'spec_helper'
require 'field'

describe Field do

  subject(:field) { Field.new(3,3) }

  describe '#grid' do
    it 'should return array' do
      expect(field.grid).to be_an Array
    end
  end

  describe '#fill_in' do
    it 'should set alive cells' do
      field.fill_in([[[0,1]]])
      expect(field.grid).to be == [[0,1,0], [0,0,0], [0,0,0]]
    end
  end

  describe '#to_s' do
    it 'should be as expected' do
      expect(field.to_s).to be == "000\n000\n000\n"
    end
  end

  describe '#make_grid' do
    it 'should be 3x3' do
      expect(field.make_grid) == [[0,0,0], [0,0,0], [0,0,0]]
    end
  end

end
