class User < ApplicationRecord
	belongs_to :skill
	has_many :quotes
	has_many :projects, through: :quotes

	has_many :directory_lines
	has_many :directories, through: :directory_lines
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
