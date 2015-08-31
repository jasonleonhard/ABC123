# My go to articles_controller.rb 
# ! html.erb req for the following: index, edit, update, destroy, article_params
# CRUD maps to GET, POST
class ArticlesController < ApplicationController
  # should make users who are not signed in redirect to sign_in page
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]


  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    # @article = Article.new
    @article = current_user.articles.build
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create                        # either: render or redirect
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
 
    if @article.save 
      redirect_to @article          # redirect just issues a new request
    else
      render 'new'                  # render when save returns false, passes @article back to new template when rendered
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article           # redirect just issues a new request
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
      params.require(:article).permit(:title, :text)
    end
end