describe 'user sees total time in space for each astronaut' do
  describe 'they visit /astronauts' do
    it 'displays the total time in space for each astronaut' do
      space_mission_1 = SpaceMission.create!(title: "Apollo 13", trip_length: 10)
      space_mission_2 = SpaceMission.create!(title: "Apollo 14", trip_length: 20)
      astronaut_1 = space_mission_1.astronauts.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: space_mission_2.id)

      visit astronauts_path
      
      expect(page).to have_content("Total Trip Length: #{astronaut_1.total_time} months")
    end
  end
end
