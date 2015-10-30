class Project < ActiveRecord::Base
	has_many :todos, dependent: :destroy
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
end
