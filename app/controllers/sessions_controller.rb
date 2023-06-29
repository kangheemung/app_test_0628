class SessionsController < ApplicationController
    def new
        
    end
     def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            session[:id]=@user.id
             redirect_to user_path(@user.id)
        else
            redirect_to root_url
        end
        def logout
        
        end
     end
end
