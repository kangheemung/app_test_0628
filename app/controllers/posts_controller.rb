class PostsController < ApplicationController
  def index
    @post =Post.all
  end
  def new 
    @post = Post.new
  end
  def create
    user=User.find_by(id: session[:id])
    @post=user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to users_show_path(user.id)
    else
      render :new
    end  
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end
  def update
       @post=Post.find_by(id: params[:id])
     if @post.update(post_params)
        flash[:notice]="プランナー情報を更新しました。"
        redirect_to users_show_path(@post.id) 
     else
        render :edit
     end
  end
  def destroy
    @post=Post.find_by(id: params[:id]).destroy
      redirect_to users_show_path(@post.id) 
  end
  private
    def post_params
       params.require(:post).permit(:content,:user_id)
    end
end
