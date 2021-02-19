class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new 
  end
   def create
    @article = Article.new(article_params) 
    @article.categories = Category.find(params[:category_ids])
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was successfully created.' 
       redirect_to articles_path
        
         
    else 
      puts @article.errors.full_messages
      flash[:alert] = 'Error while creating article'
         @article = Article.new
       
    
   end 
  end
  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
