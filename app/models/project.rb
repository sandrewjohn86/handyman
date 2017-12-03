class Project < ApplicationRecord
	belongs_to :client
	has_many :quotes
	has_many :users, through: :quotes

	def has_quote_from? (target_user)
  		quotes.any? { |quote| quote.user_id == target_user.id }
  	end
end
