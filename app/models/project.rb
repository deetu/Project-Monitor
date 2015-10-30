class Project < ActiveRecord::Base
	has_many :todos
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
end
