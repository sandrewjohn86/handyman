class Clients::UsersController < Clients::ApplicationController
  before_action :authenticate_client!
  def index
  	@users = User.all
  	# @user= User.find(params[:user])
  	@directories = Directory.where(client_id: current_client.id)
  	# @client = current_client.id
    @skills = Skill.all
    # @directory_lines = DirectoryLine.all
    # @directories = directory_lines.directory
    # @quote.user_id = current_client.id
    # @user = User.find(params[:user_id])
    # @directory_line = DirectoryLine.new
  end

  def show
    
  end
end
