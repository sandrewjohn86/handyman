class UsersController < ApplicationController
  def index
  	@users = User.all
  	@directories = Directory.where(client_id: current_client.id)
  	# @client = current_client.id
    @skills = Skill.all
    @directory_lines = DirectoryLine.all
    # @directories = directory_lines.directory
    # @quote.user_id = current_client.id
  end

  def show
  end
end
