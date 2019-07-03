class Admin::PostsController < AdminController

  def index
    @posts = collection
  end

  def show
    @post = resource
    render :edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to edit_admin_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = resource
  end

  def update
    @post = resource

    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = resource
    @post.destroy
    redirect_to admin_posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def collection
      Post.all
    end

    def resource
      collection.find(params[:id])  
    end

end
