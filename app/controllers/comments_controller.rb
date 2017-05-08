class CommentsController < ApplicationController
  
  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.new(comment_params)
    #content안에 있는 comment들이라는 의미.
    @comment.save
    # redirect_to content_path(@content)
    redirect_to @content
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
