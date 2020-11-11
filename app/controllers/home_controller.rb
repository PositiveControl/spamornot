class HomeController < ApplicationController
  def index
    @market_articles = Article.where(category: "Market").first(3)
    @product_articles = Article.where(category: "Products").first(3)

    render 'home/index'
  end
end
