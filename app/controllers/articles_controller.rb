class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all.order('created_at DESC')
    @categories = Category.all.order('priority')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to articles_path

    else

      flash[:alert] = @article.errors.full_messages.first.to_s
      redirect_to new_article_path

    end
  end

  def vote
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save

      flash[:notice] = 'Voted'

    else
      flash[:alert] = 'Not Voted'
      redirect_to(articles_path)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
