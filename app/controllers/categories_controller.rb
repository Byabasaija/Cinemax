class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    @categories = Category.all.order('priority')
    @most_voted_article = Vote.most_voted
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Your category was created'
      redirect_to root_path
    else
      flash[:notice] = @category.errors.full_messages.first.to_s
      redirect_to new_category_path
    end
  end

  def show
    category = Category.find(params[:id])
    @articles = category.articles
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
