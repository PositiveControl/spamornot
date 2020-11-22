class HomeController < ApplicationController
  def index
    @email = Article.limit(1).order("RANDOM()").first

    if params[:answer] == "correct"
      session[:correct] += 1
      flash.now[:notice] = "Correct!"
    elsif params[:answer] == "incorrect"
      session[:incorrect] += 1
      flash.now[:alert] = "Incorrect :("
    end

    @total_answered = total_answered
    @correct_percent = percentage_correct
    @incorrect_percent = percentage_incorrect

    render 'home/index'
  end

  def faq
    render 'home/faq'
  end

  private

  def percentage_correct
    total_answered == 0.0 ? 0.0 : (session[:correct].to_f / total_answered * 100).to_i
  end

  def percentage_incorrect
    total_answered == 0.0 ? 0.0 : (session[:incorrect].to_f / total_answered * 100).to_i
  end

  def total_answered
    session[:incorrect] + session[:correct]
  end
end
