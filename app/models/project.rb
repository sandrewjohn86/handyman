class Project < ApplicationRecord
	belongs_to :client
	has_many :quotes
	has_many :users, through: :quotes
end
