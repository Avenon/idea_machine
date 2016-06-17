class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)

    if @project.errors.empty?
      redirect_to @project
    else
      render "edit"
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :descrition, :user_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
