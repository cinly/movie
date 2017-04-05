class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new

    if !current_user.is_member_of?(@group)
      redirect_to group_path(@group), alert: "未收藏哦！"
  	end

  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end




  private

  def post_params
    params.require(:post).permit(:content)
  end

end
