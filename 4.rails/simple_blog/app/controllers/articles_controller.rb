class ArticlesController < ApplicationController


#A frequent practice is to place the standard CRUD actions in each controller in
#the following order: index, show, new, edit, create, update and destroy. You may
#use any order you choose, but keep in mind that these are public methods; as mentioned
#earlier in this guide, they must be placed before declaring private visibility in the controller.  
  def index
    @articles = Article.all
  end
  
  def show
      @article = Article.find(params[:id])
  end
  
  def new
      @article = Article.new
  end
  
  def edit
      @article = Article.find(params[:id])
  end
  
  
  def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
  end
  
  def update
      @article = Article.find(params[:id])
     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
  end
  
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  

  
  private
  def article_params
     params.require(:article).permit(:title,:text) 
  end
  
end