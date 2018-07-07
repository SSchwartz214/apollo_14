require 'rails_helper'

describe 'user sees average age of all astronauts' do
  describe 'they visit /astronauts' do
    it 'displays average age of all astronauts' do

      astronaut_1 = Astronaut.create!(name: 'Neil Armstrong', age: 40, job: 'Commander')
      astronaut_2 = Astronaut.create!(name: 'Mike Tyson', age: 50, job: 'Enforcer')

      visit astronauts_path

      expect(page).to have_content("Average Age: 45")
    end
  end
end
