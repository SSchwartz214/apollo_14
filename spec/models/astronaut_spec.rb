require 'rails_helper'

describe Astronaut, type: :model do
  describe 'relationships' do
    it {should have_many(:space_missions).through(:astronaut_space_missions)}
  end

  describe "Class Methods" do
    describe ".average_age" do
      it "returns average_age for all astronauts" do

        Astronaut.create!(name: 'Neil Armstrong', age: 40, job: 'Commander')
        Astronaut.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')

        expect(Astronaut.average_age).to eq(45)
      end
    end
  end
  describe "Instance Methods" do
    describe ".alpha_order" do
      it "returns the astronaut's space_missions in alphabetical order" do
          space_mission_1 = SpaceMission.create(title: "Apollo 13", trip_length: 10)
          space_mission_2 = SpaceMission.create(title: "Bpollo 13", trip_length: 10)
          space_mission_3 = SpaceMission.create(title: "Cpollo 13", trip_length: 10)

          astronaut_1 = space_mission_1.astronauts.create(name: 'Neil Armstrong', age: 40, job: 'Commander')
          AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
          AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_3.id)

        expect(astronaut_1.alpha_order).to eq([space_mission_1, space_mission_2, space_mission_3])
      end
    end
    describe ".total_time" do
      it "returns the astronaut's space_missions in alphabetical order" do
          space_mission_1 = SpaceMission.create(title: "Apollo 13", trip_length: 10)
          space_mission_2 = SpaceMission.create(title: "Bpollo 13", trip_length: 10)
          space_mission_3 = SpaceMission.create(title: "Cpollo 13", trip_length: 10)

          astronaut_1 = space_mission_1.astronauts.create(name: 'Neil Armstrong', age: 40, job: 'Commander')
          AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
          AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_3.id)

        expect(astronaut_1.total_time).to eq(30)
      end
    end
  end
end
