class CommentsController < ApplicationController
  load_and_authorize_resource :article
  load_and_authorize_resource :comment, through: :article
  before_action :set_article
  def new; end

    def edit
    end

    def create
      @comment = @article.comments.new(comment_params)
      if @comment.save
        flash[:success] = "Pomyślnie utworzono komentarz"
        redirect_to article_path(@article)
      else
        flash[:notice] = "Wystąpił błąd"
    end
    end


    def destroy
      @comment = @article.comments.find(params[:id])
      if @comment.destroy
        flash[:notice] = "Pomyślnie usunięto komentarz"
        redirect_to article_path(@comment.article)
      else
        render 'show'
        flash[:notice] = "Wystąpił błąd"
      end
    end

    private
      def set_article
        @article = Article.find(params[:article_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
end
