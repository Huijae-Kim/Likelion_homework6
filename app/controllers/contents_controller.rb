class ContentsController < ApplicationController
  
  before_action :authorize, only: [:new, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def show
    @content = Content.find(params[:id])
  end

  def create
    @content = Content.new(content_params)
    @content.save
    redirect_to content_path(@content)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:id])
    # @content.delete #content만 삭제.
    @content.destroy #content에 속해있는 하위에 있는 것도 모두 삭제. 예) 댓글까지 삭제하는 것.
    # redirect_to contents_path #'/contents'
    redirect_to contents_url #'full url'
  end
  
  private
  
  def content_params
    params.require(:content).permit(:title, :body, :user_id)
  end
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end 

end
