class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    # define the post and the user in the new
    @post = Post.find(params[:post_id])
    @reply.post = @post
    @reply.user = current_user
  end
  
  def create
    @reply = Reply.new(params[:reply])
    @reply.user = current_user
    # need to have the two posts below
    @post = Post.find(params[:post_id])
    @reply.post = @post
    
    respond_to do |format|
      if @reply.save
        format.html { redirect_to(@post, :notice => 'Reply was successfully created.')}
      else
        format.html { render :action => "new", :notice => 'Try filling out all fields.'}
      end
    end
  end
end
