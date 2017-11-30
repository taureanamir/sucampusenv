class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
    if user_signed_in?
      if current_user.role_id == 1
        @article = Article.find(params[:id])
      else
        @article = Article.where(:id=>params[:id]).where(:is_published=>true).first
      end
    else
      @article = Article.where(:id=>params[:id]).where(:is_published=>true).first
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        format.html {redirect_to articles_path, notice: 'Your article has been submitted for review !!!'}
        format.json {render :show, status: :created, location: @article}
      else
        format.html {render :new}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit

      if params[:status] == 'Approved'
        Article.find(params[:id]).update_attribute('status', 'Approved')
        Article.find(params[:id]).update_attribute('is_published', true)
        Article.find(params[:id]).update_attribute('updated_at', Time.now)
        @notice = 'Article approved !!!'

      elsif params[:status] == 'Rejected'
        Article.find(params[:id]).update_attribute('status', 'Rejected')
        Article.find(params[:id]).update_attribute('is_published', false)
        Article.find(params[:id]).update_attribute('updated_at', Time.now)
        @notice = 'Article rejected !!!'

      end

      redirect_to sucampusenv_articles_list_path, notice: @notice

  end

  def upvote
    @article = Article.find(params[:id])
    @article.upvote_by current_user
    redirect_to articles_path
  end

  def downvote
    @article = Article.find(params[:id])
    @article.downvote_by current_user
    redirect_to articles_path
  end

  private
  def article_params
    #params[:article]
    params.require(:article).permit(:title, :content, :is_published)
  end

end
