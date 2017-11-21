class DirectoryLinesController < ApplicationController
  def new
  end

  def create
    @directory = Directory.find(params[:directory_id])
    # @user = User.find(params[:user_id])
    @directory_line = @directory.directory_lines.create(params[:directory_line].permit(:directory_id, :user_id))
    @directory_line.user_id = User.find(params[:user_id])

    if @directory_line.save
      flash[:notice] = 'Contact Added'
      redirect_to directory_path(@directory)
    else
      render 'new'
    end
  end

end
