class User < ApplicationRecord
	has_secure_password
	
	has_many :users_itineraries
	has_many :itineraries, through: :users_itineraries

	has_many :days, through: :itineraries
	has_many :days_locations, through: :days
	has_many :locations, through: :days_locations
	has_many :locations_activities, through: :locations
	has_many :activities, through: :locations_activities
end
