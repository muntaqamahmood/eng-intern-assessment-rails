class ArticlesController < ApplicationController
  # root GET /
  def index
    @articles = Article.all
  end

  # article GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # new_article GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      # if success, redirect to /article/:id
      redirect_to @article
    else
      # render new article again & status code 422  
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :author, :date)
    end

end
