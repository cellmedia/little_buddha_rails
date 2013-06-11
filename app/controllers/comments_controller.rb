class CommentsController < ApplicationController
  
  def create
      #setup comment instance based on post
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(params[:comment])
      
      #store current user to comments user_id/commenter attributes
      @comment.user_id = current_user.id
      @comment.commenter = current_user.email
      
      #save instance of object
      @comment.save
      redirect_to post_path(@post)
  end
  
  def destroy
      #find comment based on post 
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      
      #and destroy
      @comment.destroy
      redirect_to post_path(@post)
  end
  
end

