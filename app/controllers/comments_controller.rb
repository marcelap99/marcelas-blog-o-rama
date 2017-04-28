class CommentsController < ApplicationController
http_basic_authenticate_with name: "marcela", password: "12345", only:[:destroy]
def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.save
    redirect_to post_path(@post)
end


def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end


private def comment_params
  params.require(:comment).permit(:username, :body)
end




end



#   def new
#   end
#
#   def create
#     @comments = Comments.new(
#     user_id: params [:posts][:user_id],
#     content: params[:posts][:content]
#     )
#   end
#
#   def index
#     @comments = Comments.all
#   end
#
#   def edit
#     @comments = Comments.find(params[:id])
#   end
#
#   def update
#     @comments = Comments.find(params[:id])
#     user_id: params [:posts][:user_id],
#     content: params[:posts][:content]
#   end
#
#   def show
#     @comments = Comments.find(params[:id])
#   end
#
#   def destroy
#     @comments = Comments.find(params[:id])
#   redirect_to posts_path
#   end
#
#
#
#
#
#
# end
