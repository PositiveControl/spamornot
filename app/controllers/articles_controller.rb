class ArticlesController < ApplicationController
  access all: [:index], [:user, :admin] => {except: [:new, :create, :edit, :destroy]}, editor: :all

  def index
    @articles = Article.all
    render 'articles/index'
  end

  def new
    @article = Article.new

    render 'articles/new'
  end

  def create
    article = Article.create(article_params)

    redirect_to article_path(article.id), notice: "Your article has been published!"
  end

  def show
    authenticate_user!
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    unless belongs_to_editor?(@article)
      redirect_to 'articles/index', notice: "You are not permitted to edit this article."
    end
  end

  def update
    notice = ""
    article = Article.find(params[:id])
    if belongs_to_editor?(article)
      article.update(article_params)
      notice = "Your article has been updated."
    else
      notice = "The article you are attempting to update does not belong to you."
    end

    redirect_to article_path(article.id), notice: notice
  end

  def destroy
    notice = ""
    article = Article.find(params[:id])
    if belongs_to_editor?(article)
      article.destroy
      notice = "Your article was deleted"
    else
      notice = "The article you are attempting to delete does not belong to you."
    end

    redirect_to articles_path, notice: notice
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category, :spam, :user_id, :screenshot)
  end

  def belongs_to_editor?(article)
    article.user_id == current_user.id && logged_in?(:editor)
  end
end
