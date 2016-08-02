class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      if params[:tag]
        @ideas = Idea.tagged_with(params[:tag])
      else
        @ideas = current_user.ideas
      end
    end
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    respond_to do |format|
      if @idea.save
        #redirect_to ideas_path
        format.js
      else
        #render "new"
        format.html { render root_path }
      end
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
    params.require(:idea).permit(:description, :user_id, :all_tags)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
