class User < ApplicationRecord
	belongs_to :skill
	has_many :quotes
	has_many :projects, through: :quotes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
