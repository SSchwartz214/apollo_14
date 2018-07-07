class Astronaut < ApplicationRecord
  has_many :astronaut_space_missions
  has_many :space_missions, through: :astronaut_space_missions

  def self.average_age
    average(:age)
  end

  def alpha_order
    space_missions.order(:title)
  end
end
