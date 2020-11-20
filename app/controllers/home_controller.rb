class HomeController < ApplicationController
  def index
    @email = Article.last #where(category: "Email").first

    if params[:answer] == "correct"
      flash.now[:notice] = "Correct!"
    elsif params[:answer] == "incorrect"
      flash.now[:alert] = "Incorrect :("
    end

    render 'home/index'
  end

  def faq
    render 'home/faq'
  end
end
