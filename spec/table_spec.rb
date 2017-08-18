require 'spec_helper'
require 'position'
require 'table'
require 'faker'


describe Table do

  let(:length){Faker::Number.between(1, 10)}
  let(:width){Faker::Number.between(1, 10)}

  let(:table){Table.new(length, width)}
  let(:out_of_boundaries_position){Position.new(length,0,'west')}
  let(:in_boundaries_position){Position.new(Faker::Number.between(0, length-1),
                                            Faker::Number.between(0, width-1),'west')}

  describe '.in_boundaries' do
    context 'coordinates out of boundaries' do
      it 'should return false' do
        expect(table.in_boundaries?(out_of_boundaries_position)).to eq false
      end
    end

    context 'coordinates in boundaries' do
      it 'should return true' do
        expect(table.in_boundaries?(in_boundaries_position)).to eq true
      end
    end
  end
end
