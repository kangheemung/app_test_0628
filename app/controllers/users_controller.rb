class UsersController < ApplicationController

  def index
      @users=User.all
  end
  def new
    @user=User.new
    
  end
  def create
    p "================"
    p params
    p "================"
     @user=User.new(user_params)
    if @user.save
      session[:id]=@user.id
       redirect_to user_path(@user.id)
       flash[:email] = "Your message was successfully sent."
     p "================"
    p params
    p "================"
    else
        flash.now[:error] = 'Invalid email/password combination'
         render 'new'
    end
    
  end
  def update
    @user = User.find_by(id: params[:id])
     if @user.update(user_params)
       flash[:success] = "Profile updated"
       redirect_to user_path(@user.id)
     else
        render :edit
     end
  end
  def edit
      @user=User.find_by(id: params[:id])
  end

  def show
      @user=User.find_by(id: params[:id])
      @posts=@user.posts.all
  end
  def destroy
    user = User.find_by(id: params[:id])
     flash[:success] = "本当に削除しますか。"
      user.destroy
          redirect_to root_path, notice: "削除が完了しました"
    flash[:success] = "User deleted"
    redirect_to user_index_path
  end
   private
    def user_params
       params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
