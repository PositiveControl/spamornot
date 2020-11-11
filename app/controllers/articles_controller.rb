class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render 'articles/index'
  end

  def create

  end

  def show
    authenticate_user!
    @article = Article.find(params[:id])
  end

  def update

  end

  def delete

  end
end
