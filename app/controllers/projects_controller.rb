class ProjectsController < ApplicationController
  # before_filter :require_permission, only: :edit
  # before_filter :authenticate_client!
  before_filter :authenticate_user!



  def index
    @projects = Project.all
    # @project = Project.find(params[:id => :project_id])
    # @quotes = @project.quotes
  end

  def show
    @project = Project.find(params[:id])
    @quote = Quote.new
    @average = Quote.average(:total)

     @quotes = Quote.all
    # @quotes = Quote.all
    # @quote = @project.quotes.includes(:user)
    # @quote = current_user.quotes
    
  end

  private
  def project_params
    params.require(:project).permit(:project_title, :project_desc, :address, :budget, :client_id)
  end

  #  def require_permission
  #   if current_client != Project.find(params[:id]).client
  #     flash[:notice] = "You do not have permission to edit this project"
  #     redirect_to projects_path
  #   end
  # end
end
