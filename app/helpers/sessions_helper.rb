module SessionsHelper
    
    def login(user)
        session[:user_id] = user.id
    end
    
    def current_user
        
        #첫번째 방법
        if @current_user.nil? #@current_user가 비어있으면,
            @current_user = User.find_by(id: session[:user_id])
        else
            @current_user = @current_user
        end
        
        #두번째 방법
        # @current_user = @current_user || User.find_by(id: session[:user_id])
        
        # #세번째 방법
        # @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        
    end
    
end
