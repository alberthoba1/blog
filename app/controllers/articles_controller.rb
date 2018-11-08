class ArticlesController < ApplicationController
  load_and_authorize_resource
  def index; end

  def new; end

  def edit; end

  def test_2
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Artykuł zaaktualizowany"
      redirect_to article_path(@article)
    else
      render 'edit'

    end
  end

  def create
   @article = Article.new(article_params)
   @article.user = current_user
    if @article.save
      flash[:success] = "Artykuł utworzono pomyślnie"
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
    flash[:notice] = "Usunięto artykuł"
    redirect_to articles_path
  end

  private


  def article_params
    params.require(:article).permit(:title, :description)
  end

end
