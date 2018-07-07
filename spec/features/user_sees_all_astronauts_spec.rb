require 'rails_helper'

describe 'user sees all astronauts' do
  describe 'they visit /astronauts' do
    it 'displays all astronauts' do
      astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
      astronaut_2 = Astronaut.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')

      visit astronauts_path

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_2.name)
    end
  end
end
