class Clients::DirectoryLinesController < Clients::ApplicationController
  before_filter :authenticate_client!
  def new
    # @directory = Directory.find(params[:directory_id])
    # @user = User.find(params[:user_id])
    # @directory_line = DirectoryLine.new
    # logger.info(@user.id)
    
  end

  def create
    # logger.info(:user_id)

    @directory = Directory.find(params[:directory_id])
    @user = User.find(params[:user_id])
    # # @directory_line = DirectoryLine.new
    # logger.info(@user.id)
    # @directory_line = DirectoryLine.new(directory_line_params)
    @directory_line = @directory.directory_lines.build(directory_line_params)
    # @directory_line.user_id = @user.id
    # @directory_line.directory_id = @directory.id

    if @directory_line.save
      flash[:notice] = 'Contact Added'
      redirect_to clients_directory_path(@directory)
    else
      render 'new'
    end
  end

  private

  def directory_line_params
    params.permit(:directory_id, :user_id)
  end

end
