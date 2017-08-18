require 'spec_helper'
require 'robot'
require 'position'
require 'table'
require 'faker'


describe Position do

  context 'initialize' do

    let(:wrong_face_position){ Position.new(1, 2, 'High') }
    let(:wrong_coordinates_position){ Position.new(1.0, 2, 'WEST') }


    let(:x) {Faker::Number.between(1, 10)}
    let(:y) {Faker::Number.between(1, 10)}
    let(:face) {Position::FACES.sample}
    let(:position){Position.new(x, y, face) }


    context 'initialize' do
      context 'wrong inputs' do
        context 'wrong face' do
          it 'should raise an error' do
            expect{wrong_face_position}.to raise_error ArgumentError
          end
        end

        context 'wrong coordinates' do
          it 'should raise an error' do
            expect{wrong_coordinates_position}.to raise_error ArgumentError
          end
        end
      end

      context 'right inputs' do
        it 'should set the values' do
          expect(position.x).to eq x
          expect(position.y).to eq y
          expect(position.face).to eq face
        end
      end
    end

    context 'setters' do
      context 'wrong arguments' do
        it 'should raise an error' do
          expect{position.x = 1.0}.to raise_error ArgumentError
        end
      end

      context 'right arguments' do
        it 'should assign the right argument' do
          position.face = 'east'
          expect(position.face).to eq 'EAST'
        end
      end
    end

  end


end
