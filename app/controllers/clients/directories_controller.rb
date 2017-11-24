class Clients::DirectoriesController < Clients::ApplicationController
  before_filter :require_permission, only: [:show]
  before_filter :authenticate_client!
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
      redirect_to clients_directories_path
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
    @directories = current_client.directories
    @client = current_client
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

  def require_permission
    if current_client != Directory.find(params[:id]).client
      flash[:notice] = "You do not have permission to view this directory"
      redirect_to clients_directories_path
    end
  end
end
