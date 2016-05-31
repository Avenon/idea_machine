class HomeController < ApplicationController
  def index
    if user_signed_in?
      @ideas = current_user.ideas
    end
  end
end
