class SkillsController < ApplicationController
  def new
    @page_title = 'Add Skill Category'
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = 'Skill category created'
      redirect_to skills_path
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
  end

  def show
  end

  private
  def skill_params
    params.require(:skill).permit(:skill_name)
  end
end
