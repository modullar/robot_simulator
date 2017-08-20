require 'spec_helper'
require 'robot_controller'
require 'robot'
require 'position'
require 'table'
require 'faker'


describe RobotController do
  let(:length){Faker::Number.between(5, 10)}
  let(:width){Faker::Number.between(5, 10)}

  let(:table){Table.new(length, width)}
  let(:robot){Robot.new(table)}


  let(:robot_controller){RobotController.new(robot)}

  let(:place_command){'PLACE 2, 2, SOUTH'}
  let(:turn_right_command){'RIGHT'}
  let(:turn_left_command){'LEFT'}
  let(:move_command){'MOVE'}
  let(:report_command){'REPORT'}


  describe '.execute' do
    context 'place command' do
      it 'should place the robot' do
        expect(robot).to receive(:place)
        robot_controller.execute(place_command)
      end
    end

    context 'turn right command' do
      before do
        robot_controller.execute(place_command)
      end
      it 'should turn the robot right' do
        expect(robot).to receive(:turn_right)
        robot_controller.execute(turn_right_command)
      end
    end

    context 'turn left command' do
      before do
        robot_controller.execute(place_command)
      end
      it 'should turn the robot left' do
        expect(robot).to receive(:turn_left)
        robot_controller.execute(turn_left_command)
      end
    end

    context 'move command' do
      before do
        robot_controller.execute(place_command)
      end
      it 'should move the robot' do
        expect(robot).to receive(:move)
        robot_controller.execute(move_command)
      end
    end

    context 'report command' do
      it 'should call report on robot' do
        expect(robot).to receive(:report)
        robot_controller.execute(report_command)
      end
    end
  end

end
