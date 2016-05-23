class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(get_idea_params)

    if @idea.save
      redirect_to ideas_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @idea.update_attributes(get_idea_params)

    if @idea.errors.empty?
      redirect_to @idea
    else
      render "edit"
    end
  end

  def destroy
    @idea.destroy
    redirect_to idea_path
  end

  private

  def get_idea_params
    params.require(:idea).permit(:idea_text)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end
end
