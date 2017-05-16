class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email_nickname])
    user = User.find_by(nickname: params[:email_nickname])
    
    if user && user.authenticate(params[:password])
      #로그인 성공했을 때
      session[:user_id] = user.id
      redirect_to contents_path
    else
      #로그인 실패했을 때
      flash[:alert] = 'login error'
      render 'new' #sessions#new로 갈 것. 로그인창으로 돌아간다.
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to contents_path
  end
  
end
