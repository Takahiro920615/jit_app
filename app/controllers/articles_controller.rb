class ArticlesController < ApplicationController

def new
  @article = Article.new
end

def create
  @article = Article.new(title: params[:article][:title], content: params[:article][:content])
  #article.saveがfalseになっている。
    @article.save 
    redirect_to user_articles_url
end

def index
  @articles = Article.all
end

def show
end
  

  


end