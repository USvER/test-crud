class Admin::PostsController < AdminController
  add_breadcrumb "Posts", :admin_posts_path

  def index
    add_breadcrumb "All"
    @posts = collection
  end

  def show
    @post = resource

    render partial: 'modal_form', layout: false
  end

  def new
    add_breadcrumb "New"
    @post = Post.new
    
    render partial: 'modal_form', layout: false
  end

  def create
    add_breadcrumb "New"
    @post = Post.new(post_params)
    
    @post.save

    render partial: 'modal_form', layout: false
  end

  def edit
    @post = resource

    add_breadcrumb @post.title, edit_admin_post_path(@post)
    add_breadcrumb "Edit"

    render partial: 'modal_form', layout: false
  end

  def update
    @post = resource

    add_breadcrumb @post.title, edit_admin_post_path(@post)
    add_breadcrumb "Edit"

    @post.update(post_params)
    render partial: 'modal_form', layout: false
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
