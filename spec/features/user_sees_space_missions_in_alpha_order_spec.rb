require 'rails_helper'

describe 'user sees a list space missions in alphabetical order for each astronaut' do
  describe 'they visit /astronauts' do
    it 'displays a list of space missions in alphabetical order for each astronaut' do
      space_mission_1 = SpaceMission.create!(title: "Apollo 13", trip_length: 12)
      astronaut_1 = space_mission_1.astronauts.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      astronaut_2 = space_mission_1.astronauts.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')
      space_mission_2 = SpaceMission.create!(title: "Capricorn 4", trip_length: 12)
      astronaut_3 = space_mission_2.astronauts.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      astronaut_4 = space_mission_2.astronauts.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')
      space_mission_3 = SpaceMission.create!(title: "Gemini 7", trip_length: 12)
      astronaut_5 = space_mission_3.astronauts.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      astronaut_6 = space_mission_3.astronauts.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')

      visit astronauts_path

      expect(page).to have_content("Apollo 13\nCapricorn 4\nGemini 7")
    end
  end
end
