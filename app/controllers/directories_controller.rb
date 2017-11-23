class DirectoriesController < ApplicationController
  def new
    @page_title = 'Directories'
    @directory = current_client.directories.build
    @clients = Client.all
    # @user = User.find(params[:id])
  end

  def create
    @directory = current_client.directories.build(directory_params)
    if @directory.save 
      flash[:notice] = 'Directory created'
      redirect_to directories_path
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @directories = Directory.all
  end

  def show
    @directory = Directory.find(params[:id])
    @directory_line = DirectoryLine.new
    @directory_lines = DirectoryLine.all
  end

  private
  def directory_params
    params.require(:directory).permit(:directory_title, :directory_desc, :client_id)
  end
end
