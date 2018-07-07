require 'rails_helper'

describe Astronaut, type: :model do
  describe 'relationships' do
    it {should have_many(:space_missions).through(:astronaut_space_missions)}
  end
end
