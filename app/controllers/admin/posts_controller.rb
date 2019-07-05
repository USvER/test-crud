class Admin::PostsController < AdminController
  add_breadcrumb "Posts", :admin_posts_path

  def index
    add_breadcrumb "All"
    @posts = collection

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show
    @post = resource
    add_breadcrumb @post.title
  end

  def new
    @post = Post.new
    
    render partial: 'modal_form', layout: false
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      add_breadcrumb "All"
      @posts = collection

      render 'index.js.erb', layout: false
    else
      render partial: 'modal_form', layout: false
    end
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

    if @post.update(post_params)
      add_breadcrumb "All"
      @posts = collection

      render 'index.js.erb', layout: false
    else
      render partial: 'modal_form', layout: false
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
