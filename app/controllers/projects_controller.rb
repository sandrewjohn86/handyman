class ProjectsController < ApplicationController
  def new
    @page_title = 'Create Project'
    @project = current_client.projects.build
  end

  def create
    @project = current_client.projects.build(project_params)
    if @project.save
      flash[:notice] = 'Project created'
      redirect_to projects_path
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
    @projects = Project.all
  end

  def show
  end

  private
  def project_params
    params.require(:project).permit(:project_title, :project_desc, :address, :budget, :client_id)
  end
end
