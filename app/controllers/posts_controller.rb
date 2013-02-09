class PostsController < ApplicationController
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    # make a new instance of the Post class
    # Rails automatically thinks you want to go to new.html.erb b/c you didn't specify anything in respond_to
    @post = Post.new
  end
  
  def create
    # create a new post with the parameters of the post model (params is a hash with post information, you pull posts's info here)
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    
    respond_to do |format|
      # if saving the post is successful, tell user that the post was created, and then redirect them to the page with that posts's info (show page)
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.')}
      # if saving is not successful, redirects to the new action so that you can see the form again, added a note to tell you to fill out all fields
      else
        format.html { render :action => "new", :notice => 'Try filling out all fields.'}
      end
    end
  end
  
  def show
    # show action just shows that particular post's info
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    
    #going to show.html.erb by default, important to define user so that @user can be used in views
  end
  
  def edit
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/posts', notice: 'Post was sucessfully deleted.'}
    end
  end
  
end
