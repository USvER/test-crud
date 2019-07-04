class Admin::PostsController < AdminController
  add_breadcrumb "Posts", :admin_posts_path

  def index
    add_breadcrumb "All"
    @posts = collection
  end

  def show
    @post = resource

    add_breadcrumb @post.title, edit_admin_post_path(@post)
    add_breadcrumb "Edit"
    render :edit
  end

  def new
    add_breadcrumb "New"
    @post = Post.new
  end

  def create
    add_breadcrumb "New"
    @post = Post.new(post_params)

    if @post.save
      redirect_to edit_admin_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = resource

    add_breadcrumb @post.title, edit_admin_post_path(@post)
    add_breadcrumb "Edit"

  end

  def update
    @post = resource

    add_breadcrumb @post.title, edit_admin_post_path(@post)
    add_breadcrumb "Edit"

    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = resource
    @post.destroy

    flash[:notice] = 'Post successfully deleted'
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
