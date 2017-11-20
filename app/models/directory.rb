class Directory < ApplicationRecord
  belongs_to :client
  has_many :directory_lines
  has_many :user, through: :directory_lines
end
