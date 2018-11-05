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
        flash[:success] = "Careful now Ned"
        redirect_to article_path(@article)
      else
        raise "error"
    end
    end


    def destroy
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      flash[:notice] = "Coward"
      redirect_to article_path(@comment.article)
    end

    private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
