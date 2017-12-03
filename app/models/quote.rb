class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # def has_quote_from? (target_user)
  # 	quotes.any? { |quote| like.user_id == target_user.id }
  # end
end
