class Users::ProjectsController < Users::ApplicationController
  # before_filter :require_permission, only: :edit
  # before_filter :authenticate_client!
  before_filter :authenticate_user!

  def index
    @user = current_user
    @projects = @user.projects_with_quotes()
    # @project = Project.find(params[:id])
    @quote = Quote.find(params[:id])
    @quotes = Quote.all

  end

  def show
    @project = Project.find(params[:id])
    @quote = Quote.new
    @quotes = Quote.all
  end

  # private
  # def project_params
  #   params.require(:project).permit(:project_title, :project_desc, :address, :budget, :client_id)
  # end

  #  def require_permission
  #   if current_client != Project.find(params[:id]).client
  #     flash[:notice] = "You do not have permission to edit this project"
  #     redirect_to projects_path
  #   end
  # end
end
