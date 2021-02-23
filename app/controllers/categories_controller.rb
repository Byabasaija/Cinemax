class CategoriesController < ApplicationController
    def index
        @categories = Category.all.order('priority')  
        
    end
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Your category was created"
            redirect_to root_path
        else
            flash[:notice] = "Error while creating category"
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
