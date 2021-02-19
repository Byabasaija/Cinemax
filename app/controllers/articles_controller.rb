class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @categories = Category.all.map{|category| [ category.name, category.id ] }
  end
   def create
    @article = Article.new(article_params) 
    @article.category_id = params[:category_id] 
    if @article.save 
       redirect_to @article
        flash[:notice] = 'Article was successfully created.'
         
    else 
         render new
        flash[:alert] = 'Error while creating article'
    
   end 
   end
  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
