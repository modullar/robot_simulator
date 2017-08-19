require 'spec_helper'
require 'robot'
require 'position'
require 'table'
require 'faker'


describe Robot do

  let(:length){Faker::Number.between(1, 10)}
  let(:width){Faker::Number.between(1, 10)}

  let(:table){Table.new(length, width)}
  let(:robot){Robot.new(table)}

  let(:invalid_position){Position.new(-1,1,'west')}
  let(:valid_position){Position.new(Faker::Number.between(0, table.length - 1),
                                            Faker::Number.between(0, table.width - 1),
                                            'west')}


  context 'initialize' do
    it 'should have a position nil' do
      expect(robot.table).to eq table
      expect(robot.position).to eq nil
    end
  end

  describe '.place' do
    context 'invalid place params' do
      before do
        robot.place(invalid_position)
      end
      it 'should ignore the order and keep the current values' do
        expect(robot.position).to eq nil
      end
    end

    context 'valid place parameters' do
      before do
        robot.place(valid_position)
      end

      it 'should place the robots in the new position' do
        expect(robot.position.x).to eq valid_position.x
        expect(robot.position.y).to eq valid_position.y
        expect(robot.position.face).to eq valid_position.face
      end
    end
  end


  describe '.placed?' do
    context 'before robot is placed' do
      it 'returns false' do
        expect(robot.placed?).to be false
      end
    end

    context 'after robot is placed' do
      before do
        robot.place(valid_position)
      end
      it 'returns true' do
        expect(robot.placed?).to be true
      end
    end
  end


  describe '.move' do

    context 'out of boundaries' do
      before do
        valid_position.x = 0
        valid_position.y = 0
        valid_position.face = 'WEST'
        robot.place(valid_position)
      end
      it 'does not move' do
        old_position = robot.position
        robot.move
        expect(robot.position.x).to eq old_position.x
        expect(robot.position.y).to eq old_position.y
        expect(robot.position.face).to eq old_position.face
      end
    end

    context 'in boundaries' do
      before do
        valid_position.x = 0
        valid_position.y = 0
        valid_position.face = 'EAST'
        robot.place(valid_position)
      end
      it 'moves the robot position' do
        old_position = robot.position
        robot.move
        expect(robot.position.x).to eq old_position.x + 1
        expect(robot.position.y).to eq old_position.y
        expect(robot.position.face).to eq old_position.face
      end
    end
  end

  describe '.report' do
    context 'the robot is placed' do
      before do
        robot.place(valid_position)
      end
      it 'should produce a string of the robot position' do
        expect(robot.report).to eq("#{valid_position.x},#{valid_position.y},#{valid_position.face}")
      end
    end

    context 'the robot is not placed yet' do
      it 'produces not placed' do
        expect(robot.report).to eq 'not placed yet'
      end

    end
  end


end
