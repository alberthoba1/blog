class ArticlesController < ApplicationController
  load_and_authorize_resource
  def index; end

  def new; end

  def edit; end

  def test_2
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "artykul zaaktualizowany"
      redirect_to article_path(@article)
    else
      render 'edit'

    end
  end

  def create
   @article = Article.new(article_params)
   @article.user = current_user
    if @article.save
      flash[:success] = "create more articles before i piss myself"
      redirect_to article_path(@article)
    else
      render 'new'
   end
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  def destroy
    @article.destroy
    flash[:notice] = "Usunieto artykul"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
