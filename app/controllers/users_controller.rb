class UsersController < ApplicationController
  def index
  	@users = User.all
    @skills = Skill.all
  end

  def show
  end
end
