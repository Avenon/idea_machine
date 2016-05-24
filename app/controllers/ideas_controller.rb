class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)

    if @idea.save
      redirect_to ideas_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @idea.update_attributes(idea_params)

    if @idea.errors.empty?
      redirect_to @idea
    else
      render "edit"
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:idea_text)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
