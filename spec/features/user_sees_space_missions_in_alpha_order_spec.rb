require 'rails_helper'

describe 'user sees a list space missions in alphabetical order for each astronaut' do
  describe 'they visit /astronauts' do
    it 'displays a list of space missions in alphabetical order for each astronaut' do

      space_mission_1 = SpaceMission.create!(title: "Apollo 13", trip_length: 12)
      space_mission_2 = SpaceMission.create!(title: "Capricorn 4", trip_length: 10)
      space_mission_3 = SpaceMission.create!(title: "Gemini 7", trip_length: 14)
      astronaut_1 = space_mission_1.astronauts.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)
      AstronautSpaceMission.create(astronaut_id: astronaut_1.id, space_mission_id: space_mission_3.id)

      visit astronauts_path

      expect(page).to have_content("#{space_mission_1.title} #{space_mission_2.title} #{space_mission_3.title}")
    end
  end
end
