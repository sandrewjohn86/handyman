class Clients::ProjectsController < Clients::ApplicationController
  before_filter :require_permission, only: [:edit, :show, :update, :destroy, :update, :new]
  before_filter :authenticate_client!
  # before_filter :authenticate_user!

  def new
    @page_title = 'Create Project'
    @project = current_client.projects.build
    @client = Client.find(params[:client_id])
  end

  def create
    @project = current_client.projects.build(project_params)
    if @project.save
      flash[:notice] = 'Project created'
      redirect_to clients_projects_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  def index
    @projects = current_client.projects
    # @client = Client.find(params[:client_id])

  end

  def show
    @project = Project.find(params[:id])
    @quote = Quote.new
    @quotes = Quote.all
  end

  private
  def project_params
    params.require(:project).permit(:project_title, :project_desc, :address, :budget, :client_id)
  end

  def require_permission
    if current_client != Project.find(params[:id]).client
      flash[:notice] = "You do not have access to this project"
      redirect_to clients_projects_path
    end
  end
end
