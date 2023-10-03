class ArticlesController < ApplicationController

  def new
    @article = Article.new
    @user = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    @article = user.articles.build(article_params)

    if params[:article][:image].present?
      @article.image.attach(params[:article][:image])
      
    else
      @article.image = 'article_images/images.png'
    end
      @article.save 
      redirect_to user_articles_url(user)
  end

  def index
    @user = User.find(params[:user_id])
    @articles = Article.all
  end

  def show
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    @article = user.articles.find(params[:id])

    if params[:article][:image].present?
      @article.image.attach(params[:article][:image])
      
    else
      @article.image = 'article_images/images.png'
    end

    if @article.save 
      redirect_to user_articles_url(user)
    else render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    if @article.destroy
      flash[:success]="投稿を削除しました"
      redirect_to user_articles_path(@user)
    else
      redirect_to user_articles_path(@user)
    end

  end

  
  def article_params
    params.require(:article).permit(:title, :content, :image)
  end

end