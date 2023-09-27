class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    user = User.find(params[:user_id])
    @article = user.articles.build(article_params)
    #article.saveがfalseになっている。
      @article.save 
      redirect_to user_articles_url(user)
  end

  def index
    @articles = Article.all
  end

  def show
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end

end